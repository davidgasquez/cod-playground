
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends jq

# Instal Kamu
ADD https://github.com/kamu-data/kamu-cli/releases/download/v0.102.0/kamu-cli-x86_64-unknown-linux-gnu.tar.gz /tmp/kamu-cli-x86_64-unknown-linux-gnu.tar.gz
RUN tar -zxvf /tmp/kamu-cli-x86_64-unknown-linux-gnu.tar.gz -C /tmp \
    && chmod +x /tmp/kamu-cli-x86_64-unknown-linux-gnu/kamu \
    && mv /tmp/kamu-cli-x86_64-unknown-linux-gnu/kamu /usr/local/bin/kamu

# Setup IPFS
RUN cd /tmp && wget https://dist.ipfs.io/go-ipfs/v0.17.0/go-ipfs_v0.17.0_linux-amd64.tar.gz \
    && tar -xvzf go-ipfs_v0.17.0_linux-amd64.tar.gz \
    && cd go-ipfs && bash install.sh

RUN echo "source <(kamu completions bash)" >> "/home/vscode/.bashrc"