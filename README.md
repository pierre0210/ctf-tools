# ctf-tools

> default os: Debian

## languages

- C/C++
- Python

## cmdline tools

- tmux
- git
- file
- netcat
- ltrace
- strace
- curl
- vim

### debugger

- gdb
- gef

### emulator

- QEMU
- qiling

### pwn

- pwntools
- ROPgadget

### reverse

- z3-solver

## build & run

```bash
docker build -t ctf-tools --build-arg VERSION=12 .

# linux
docker run --rm -it -v $(pwd):/workspace ctf-tools zsh

# windows
docker run --rm -it -v ${pwd}:/workspace ctf-tools zsh
```
