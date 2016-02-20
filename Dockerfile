FROM alpine:latest
MAINTAINER Patrice FERLET <metal3d@gmail.com>

WORKDIR /workspace
RUN set -ex;                                   \ 
    apk add --update nodejs python build-base; \
    npm install -g pleeease-cli;               \
    apk del python build-base;                 \
    rm -rf /var/cache/apk/*;

CMD ["pleeease-cli"]