FROM mhart/alpine-node:7.9.0
LABEL maintainer "docker@coryodaniel.com"

ENV JQ_VERSION="1.5-r3"
ENV TERRAFORM_VERSION=0.9.4
ENV ZIP_VERSION="3.0-r4"

RUN apk --no-cache update && apk --no-cache add \
    bash \
    ca-certificates \
    git \
    "jq=${JQ_VERSION}" \
    make \
    openssl \
    python \
    py-pip \
    unzip \
    wget \
    "zip=${ZIP_VERSION}" \
    && cd /tmp \
    && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
    && pip install --upgrade awscli \
    && apk del py-pip \
    && apk del py-setuptools \
    && apk del wget \
    && apk del unzip \
    && rm -rf /tmp/* \
    && rm -rf /var/cache/apk/* \
    && rm -rf /var/tmp/*

COPY . /app
WORKDIR /app
