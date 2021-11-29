# Docker introduction

## Goals

- Explain basic ideas behind docker
- Teach basic and most commonly used commands
- Teach about docker-compose and basic commands related to it
- Show common issues and how to handle them
- Show a couple of useful shell aliases

## Rules

- Tell me if I need to repeat something or when I am going to fast
- Ask questions

## Docker what is it?

- What is it
- What problems it tries to solve
- vm vs container
- Dockerfile vs docker image vs docker container
- hub.docker.com

## Basic commands

# how to run image
docker run workshops-sample-app

# how to bind port
docker run -p 4567:4567 workshops-sample-app

# how to give name to the container
docker run --name web -p 4567:4567 workshops-sample-app

# how to pass env
docker run --env HELLO="sup guys" --name web -p 4567:4567 workshops-sample-app

# how to run detached container
docker run --env HELLO="sup guys" --name web -p 4567:4567 -d workshops-sample-app

# how to build image
docker build

# how to run non default dockerfile
docker build -f ./Dockerfile.development

# how to run build without cache
docker build --no-cache

# how to tag build
docker build --tag

# how to pass args to build
docker build --build-arg

docker push

- docker pull
- docker run
- docker build
- docker push
- docker container ls/rm/cp/kill/prune/exec/logs/
- docker image build/ls/prune/pull/rm
- docker pull/build/cp/exec/images/kill/logs/ps/restart/rm/rmi/run/

## Docker-compose

### Basics

- what is a docker-compose

- docker-compose build
- docker-compose -f
- docker-compose up
- docker-compose up -d
- docker-compose down

## Common issues and how to handle them

- .dockerignore
- cache
- leftover running containers
- old images

## Useful aliases

*For some of them FZF is required and I highly recommend installing it*

```shell
alias dsh='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) sh'

alias dbash='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) bash'

alias dcrestart='compose_file=$(ls | grep docker-compose.yml | fzf); service=$(docker-compose -f $compose_file ps --service | fzf); docker-compose -f $compose_file restart $service'

alias dk='docker kill $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  )'
```

