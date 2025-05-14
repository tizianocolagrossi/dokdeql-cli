FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV CODEQL_VERSION=2.16.3

RUN apt-get update && \
    apt-get install -y \
    curl \
    unzip \
    git \
    openjdk-17-jre-headless \
    python3 \
    python3-pip \
    jq \
    && apt-get clean

RUN curl -L -o codeql.zip https://github.com/github/codeql-cli-binaries/releases/download/v${CODEQL_VERSION}/codeql-linux64.zip && \
    unzip codeql.zip -d /opt && \
    mv /opt/codeql /opt/codeql-cli && \
    ln -s /opt/codeql-cli/codeql /usr/local/bin/codeql && \
    rm codeql.zip

WORKDIR /workspace