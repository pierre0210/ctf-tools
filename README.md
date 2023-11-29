# ctf-tools

## build & run

```bash
docker build -t ctf-tools --build-arg VERSION=22.04 .
docker run --privileged --rm -it -v $(pwd):/workspace ctf-tools
docker run --privileged --rm -it -v ${pwd}:/workspace ctf-tools
```

### PS1 prompt example

```bash
PS1='\n\[\e[36m\]\w\n\[\e[m\]\[\e[90m\][\u]>\[\e[0m\] '
```
