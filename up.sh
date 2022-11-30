#CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o gomyes.linux

#name=dayugoes
#name="qttgoes"
name="kuaichuangoes"

ssh yc1 "supervisorctl stop ${name}"

ssh yc1 "mv /data/goes/${name}/gomyes.linux /data/goes/${name}/gomyes.back$(date "+%Y%m%d%H%M%S")"

scp -r gomyes.linux  yc1:/data/goes/${name}/gomyes.linux

ssh yc1 "supervisorctl start ${name}"