FROM ubuntu:focal AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y software-properties-common curl git build-essential && \
  apt-add-repository -y ppa:ansible/ansible && \
  apt-get update && \
  apt-get install -y curl git ansible build-essential && \
  apt-get clean autoclean && \
  apt-get autoremove --yes

FROM base AS test
ARG TAGS
RUN addgroup --gid 1000 zrietest
RUN adduser --gecos zrietest --uid 1000 --gid 1000 --disabled-password zrietest
USER zrietest
WORKDIR /home/zrietest

FROM test
COPY . .
CMD ["sh", "-c", "ansible-playbook $TAGS local.yml"]

