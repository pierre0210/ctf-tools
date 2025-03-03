ARG VERSION
FROM debian:${VERSION} AS builder

RUN apt-get update && \
    apt-get install zsh -y && \
    chsh -s $(which zsh)

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential gcc gdb curl vim -y && \
    sh -c "$(curl -fsSL https://gef.blah.cat/sh)"

RUN apt-get install tmux git file netcat-traditional ltrace strace -y
ENV TERM=xterm-256color
RUN echo "set -g mouse on" >> ~/.tmux.conf

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install libc6:i386 zlib1g:i386 qemu-efi qemu-user \
    libc6-armhf-cross libc6-arm64-cross gdb-multiarch qemu-system-arm python3-pip -y && \
    python3 -m pip config set global.break-system-packages true && \
    python3 -m pip install pwntools ROPgadget z3-solver qiling

FROM builder

COPY PROMPT /tmp/
RUN cat /tmp/PROMPT >> ~/.zshrc

WORKDIR /workspace
