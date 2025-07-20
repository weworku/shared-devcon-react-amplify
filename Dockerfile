#FROM node:21-alpine3.18
FROM node:22-slim
RUN set -x \
  && apt update \
  && apt upgrade -y \
  && apt install -y git curl unzip less \
  && rm -rf /var/lib/apt/lists/*

# AWS CLI v2 のインストール
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
  unzip awscliv2.zip && \
  ./aws/install && \
  rm -rf aws awscliv2.zip

ENV LESSCHARSET=utf-8
WORKDIR /usr/src/app


