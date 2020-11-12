FROM alpine:latest

WORKDIR "/usr/murph"

ARG ALPINE_SOURCE="dl-cdn.alpinelinux.org"
ARG ALPINE_MIRROR="mirrors.tuna.tsinghua.edu.cn"

ARG TAOBAO_REGISTRY="https://registry.npm.taobao.org/"

RUN sed -i "s/${ALPINE_SOURCE}/${ALPINE_MIRROR}/g" /etc/apk/repositories; \
	apk update && apk add nodejs npm; \
	npm config set registry ${TAOBAO_REGISTRY}

EXPOSE 3000

ENTRYPOINT ["npm", "run"]

CMD ["serve"]