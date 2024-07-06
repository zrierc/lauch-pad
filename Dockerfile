FROM ubuntu:jammy

ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
  apt upgrade -y && \
  apt install -y software-properties-common && \
  apt-add-repository -y ppa:ansible/ansible && \
  #   apt-add-repository -y ppa:neovim-ppa/unstable && \
  apt install -y curl git ansible build-essential

RUN addgroup --gid 1000 zrie
RUN adduser --gecos zrie --uid 1000 --gid 1000 --disabled-password zrie
RUN mkdir -p /home/zrie/.config

COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]
