ARG VERSION
FROM ubuntu:${VERSION} AS builder

RUN apt-get update && apt-get install zsh -y
RUN chsh -s $(which zsh)
RUN apt-get install locales && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y

RUN apt-get install gcc gdb curl vim -y
RUN sh -c "$(curl -fsSL https://gef.blah.cat/sh)"

RUN apt-get install tmux git file netcat ltrace strace -y
ENV TERM xterm-256color
RUN echo "set -g mouse on" >> ~/.tmux.conf

RUN dpkg --add-architecture i386 
RUN apt-get install libc6:i386 zlib1g:i386 qemu-efi qemu-user libc6-armhf-cross libc6-arm64-cross gdb-multiarch qemu-system-arm -y
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pwntools ROPgadget z3-solver qiling

FROM builder

COPY PROMPT /tmp/
RUN cat /tmp/PROMPT >> ~/.zshrc

WORKDIR /workspace
