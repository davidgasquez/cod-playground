
FROM mcr.microsoft.com/devcontainers/universal:linux

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends jq make

# Instal Kamu
ADD https://github.com/kamu-data/kamu-cli/releases/download/v0.105.0/kamu-cli-x86_64-unknown-linux-gnu.tar.gz /tmp/kamu-cli-x86_64-unknown-linux-gnu.tar.gz
RUN tar -zxvf /tmp/kamu-cli-x86_64-unknown-linux-gnu.tar.gz -C /tmp \
    && chmod +x /tmp/kamu-cli-x86_64-unknown-linux-gnu/kamu \
    && mv /tmp/kamu-cli-x86_64-unknown-linux-gnu/kamu /usr/local/bin/kamu
RUN echo "source <(kamu completions bash)" >> "/home/codespace/.bashrc"

# Install Bacalhau
RUN curl -sL https://get.bacalhau.org/install.sh | bash

# Install Iroh
RUN curl -fsSL https://sh.iroh.computer/install_laptop.sh | sh

# Install Kubo
RUN cd /tmp && wget https://dist.ipfs.io/go-ipfs/v0.17.0/go-ipfs_v0.17.0_linux-amd64.tar.gz \
    && tar -xvzf go-ipfs_v0.17.0_linux-amd64.tar.gz \
    && cd go-ipfs && bash install.sh
