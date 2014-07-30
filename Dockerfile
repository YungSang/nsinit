FROM debian:jessie

RUN apt-get update -q && apt-get install -qy curl build-essential golang git

ENV GOPATH /go

RUN go get -d github.com/docker/libcontainer/nsinit

RUN cd $GOPATH/src/github.com/docker/libcontainer/nsinit/nsinit && \
    go install . && \
    cp -f $GOPATH/bin/nsinit /usr/local/bin/

RUN cd $HOME; \
    curl -sOL https://raw.githubusercontent.com/YungSang/docker-attach/master/docker-nsinit && \
    chmod +x docker-nsinit && \
    mv -f docker-nsinit /usr/local/bin/

ADD installer /installer

CMD /installer
