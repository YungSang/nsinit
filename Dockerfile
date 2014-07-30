FROM debian:jessie

RUN apt-get update -q && apt-get install -qy curl build-essential golang git

ENV GOPATH /go

RUN go get github.com/docker/libcontainer/nsinit/nsinit && \
    cp -f $GOPATH/bin/nsinit /usr/local/bin/

RUN curl -sOL https://raw.githubusercontent.com/YungSang/docker-attach/master/docker-nsinit && \
    chmod +x docker-nsinit && \
    mv -f docker-nsinit /usr/local/bin/

ADD installer /installer

CMD /installer
