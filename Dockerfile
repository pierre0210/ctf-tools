ARG VERSION
ARG PS1
FROM ubuntu:${VERSION}

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV PS1 ${PS1}

RUN apt-get update && apt-get install gcc gdb curl vim -y
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

RUN apt-get install tmux git -y

RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pwntools
RUN python3 -m pip install ROPgadget
RUN python3 -m pip install z3-solver

RUN apt-get install netcat -y

RUN apt-get install qemu-efi qemu-user -y
RUN apt-get install libc6-armhf-cross libc6-arm64-cross gdb-multiarch qemu-system-arm -y
RUN python3 -m pip install qiling

ENTRYPOINT bash
