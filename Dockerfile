FROM golang:1.18-alpine as builder

WORKDIR /app

ENV GOPROXY=https://goproxy.cn

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk update --no-cache && apk add --no-cache tzdata upx

COPY ./go.mod ./
COPY ./go.sum ./

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 go build -ldflags "-s -w" -o server &&\
  upx -1 server -o _upx_server && \
  mv -f _upx_server server


FROM alpine as runner
WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories

RUN apk update --no-cache && apk add --no-cache  mariadb-client

COPY --from=builder /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
COPY --from=builder /app/server /app/
CMD ["/app/server"]

