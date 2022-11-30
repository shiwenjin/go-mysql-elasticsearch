#CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o gomyes.linux

name="goes-douyin"

docker build -t goes .
#
docker save -o goes.tar goes
#
## 上传镜像文件到服务器
scp -r goes.tar  yc1:/data/docker_file/goes.tar
#
ssh yc1 "docker load < /data/docker_file/goes.tar"
##
ssh yc1 "docker rm -f ${name}"
#
## 启动服务
ssh yc1 "docker run  -d --name ${name}   -v /data/docker_file/goes/douyin/etc/river.toml:/app/etc/river.toml:ro   -v /data/docker_file/goes/douyin/var:/app/var --restart=always --privileged=true goes"