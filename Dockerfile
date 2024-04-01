ARG VERSION
FROM ubuntu:${VERSION} as builder

RUN apt-get update && apt-get install zsh -y
RUN chsh -s $(which zsh)
RUN apt-get install locales && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TERM xterm-256color

RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pwntools
RUN python3 -m pip install ROPgadget
RUN python3 -m pip install z3-solver

RUN apt-get install gcc gdb curl vim -y
RUN sh -c "$(curl -fsSL https://gef.blah.cat/sh)"

RUN apt-get install tmux git file netcat ltrace strace -y

RUN apt-get install qemu-efi qemu-user -y
RUN apt-get install libc6-armhf-cross libc6-arm64-cross gdb-multiarch qemu-system-arm -y
RUN python3 -m pip install qiling

FROM builder

COPY PROMPT /tmp/
RUN cat /tmp/PROMPT >> ~/.zshrc

RUN mkdir /workspace

WORKDIR /workspace
