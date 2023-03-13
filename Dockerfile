FROM mcr.microsoft.com/devcontainers/universal:linux

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends jq make wget

# Instal Kamu
RUN curl -s "https://get.kamu.dev" | bash
RUN echo "source <(kamu completions bash)" >> "/home/codespace/.bashrc"

# Install Bacalhau
RUN curl -sL https://get.bacalhau.org/install.sh | bash
RUN echo "source <(bacalhau completion bash)" >> "/home/codespace/.bashrc"

# Install Kubo
ENV KUBO_VERSION=v0.18.1
RUN cd /tmp && wget https://dist.ipfs.io/go-ipfs/${KUBO_VERSION}/go-ipfs_${KUBO_VERSION}_linux-amd64.tar.gz \
    && tar -xvzf go-ipfs_${KUBO_VERSION}_linux-amd64.tar.gz \
    && cd go-ipfs && bash install.sh
