# Docker Symfony

Dockerfile with PHP7.4 and Symfony binary

## How to use this image

```bash
docker run --rm -it \
    --name my_symfony_app \
    --user ${UID}:${GID} \
    -v "$(pwd)":/usr/src/myapp \
    -w /usr/src/myapp \
    babeuloula/symfony:latest \
    symfony new my_project
```

Or you can add an alias on your bashrc / zshrc:

```bash
alias symfony='docker run --rm -it --name symfony_docker --user ${UID}:${GID} -v "$(pwd)":/usr/src/myapp -w /usr/src/myapp babeuloula/symfony:latest symfony'
```

```bash
symfony new my_project
symfony --full my_project
```
