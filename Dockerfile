ARG VERSION
ARG PS1_SCRIPT
FROM ubuntu:${VERSION}

RUN echo "export PS1='\n\[\e[36m\]\w\n\[\e[m\]\[\e[90m\][\u]>\[\e[0m\] '" >> ~/.bashrc

RUN apt-get update && apt-get install locales && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8 
ENV LANGUAGE en_US:en 
ENV LC_ALL en_US.UTF-8

RUN apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential -y
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install pwntools
RUN python3 -m pip install ROPgadget
RUN python3 -m pip install z3-solver

RUN apt-get install gcc gdb curl vim -y
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

RUN apt-get install tmux git file -y

RUN apt-get install netcat -y

RUN apt-get install qemu-efi qemu-user -y
RUN apt-get install libc6-armhf-cross libc6-arm64-cross gdb-multiarch qemu-system-arm -y
RUN python3 -m pip install qiling

ENTRYPOINT bash
