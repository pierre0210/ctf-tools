# ctf-tools

## build & run

```bash
docker build -t ctf-tools --build-arg VERSION=22.04 .

# linux
docker run --privileged --rm -it -v $(pwd):/workspace ctf-tools bash

# windows
docker run --privileged --rm -it -v ${pwd}:/workspace ctf-tools bash
```

### PS1 prompt example

```bash
PS1='\n\[\e[36m\]\w\n\[\e[m\]\[\e[90m\][\u]>\[\e[0m\] '
```
