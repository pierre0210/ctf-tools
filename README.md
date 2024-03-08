# ctf-tools

## build & run

```bash
docker build -t ctf-tools --build-arg VERSION=22.04 .

# linux
docker run --privileged --rm -it -v $(pwd):/workspace ctf-tools zsh

# windows
docker run --privileged --rm -it -v ${pwd}:/workspace ctf-tools zsh
```
