## Build stage - Build cadvisor from latest source
FROM golang:alpine as builder

RUN apk update && apk add --no-cache git && \
    apk add --no-cache make && \
    apk add --no-cache bash
#    apk add --no-cache gcc && \
#    apk add --no-cache libc-dev 

RUN mkdir -p $GOPATH/src/github.com/elastic/beats && \
    git clone --branch v7.4.1 --depth 1 https://github.com/elastic/beats.git $GOPATH/src/github.com/elastic/beats
WORKDIR $GOPATH/src/github.com/elastic/beats/filebeat
RUN make

## Run stage - Install dependencies and copy filebeat from builder
FROM alpine
TODO
