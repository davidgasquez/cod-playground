
FROM mcr.microsoft.com/vscode/devcontainers/base:0-ubuntu-22.04

# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Instal Kamu
ADD https://github.com/kamu-data/kamu-cli/releases/download/v0.89.0/kamu-cli-x86_64-unknown-linux-gnu.tar.gz /tmp/kamu-cli-x86_64-unknown-linux-gnu.tar.gz
RUN tar -zxvf /tmp/kamu-cli-x86_64-unknown-linux-gnu.tar.gz -C /tmp \
    && chmod +x /tmp/kamu-cli-x86_64-unknown-linux-gnu/kamu \
    && mv /tmp/kamu-cli-x86_64-unknown-linux-gnu/kamu /usr/local/bin/kamu

# Setup IPFS
RUN cd /tmp && wget https://dist.ipfs.io/go-ipfs/v0.12.2/go-ipfs_v0.12.2_linux-amd64.tar.gz \
    && tar -xvzf go-ipfs_v0.12.2_linux-amd64.tar.gz \
    && cd go-ipfs && bash install.sh

RUN echo "source <(kamu completions bash)" >> "/home/vscode/.bashrc"