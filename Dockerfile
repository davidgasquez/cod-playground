
FROM mcr.microsoft.com/devcontainers/universal:linux

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends jq make

# Instal Kamu
RUN curl -s "https://get.kamu.dev" | sh
RUN echo "source <(kamu completions bash)" >> "/home/codespace/.bashrc"

# Install Bacalhau
RUN curl -sL https://get.bacalhau.org/install.sh | bash

# Install Iroh
RUN curl -fsSL https://sh.iroh.computer/install_laptop.sh | sh

# Install Kubo
RUN cd /tmp && wget https://dist.ipfs.io/go-ipfs/v0.17.0/go-ipfs_v0.17.0_linux-amd64.tar.gz \
    && tar -xvzf go-ipfs_v0.17.0_linux-amd64.tar.gz \
    && cd go-ipfs && bash install.sh
