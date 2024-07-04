FROM ubuntu:jammy

ARG TAGS
WORKDIR /usr/local/bin
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && \
  apt upgrade -y && \
  apt install -y software-properties-common && \
  apt-add-repository -y ppa:ansible/ansible && \
  apt-add-repository -y ppa:neovim-ppa/stable && \
  apt install -y curl git ansible build-essential neovim

FROM base AS test
ARG TAGS
RUN addgroup --gid 1000 zrietest
RUN adduser --gecos zrietest --uid 1000 --gid 1000 --disabled-password zrietest
USER zrietest
WORKDIR /home/zrietest

FROM test
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

