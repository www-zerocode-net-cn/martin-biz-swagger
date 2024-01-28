FROM erdonline/jdk8-yum-go:latest

MAINTAINER martin114@foxmail.com

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN mkdir -p /martin-biz-swagger

WORKDIR /martin-biz-swagger

EXPOSE 9403

ADD ./martin-biz/martin-biz-swagger/target/martin-biz-swagger.xjar ./

ADD ./martin-biz/martin-biz-swagger/target/xjar.go ./

RUN go version

RUN go build xjar.go

ENTRYPOINT ./xjar java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar martin-biz-swagger.xjar
