FROM golang:latest
MAINTAINER Jess Frazelle <jess@docker.com>

RUN go get github.com/bitly/go-nsq && \
    go get github.com/Sirupsen/logrus && \
    go get github.com/drone/go-github/github

COPY . /go/src/github.com/jfrazelle/nsqexec
RUN cd /go/src/github.com/jfrazelle/nsqexec && go install . ./...
ENV PATH $PATH:/go/bin

# make git happy
RUN git config --global user.name nsqexec && \
    git config --global user.email nsqexec@dockerproject.com

ENTRYPOINT ["nsqexec"]