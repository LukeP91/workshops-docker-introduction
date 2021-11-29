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

## Docker introduction

- What is it?
- What problems it tries to solve?
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

# how to build non default dockerfile
docker build -f ./Dockerfile.development

# how to run build without cache
docker build --no-cache

# how to tag build
docker build --tag

# how to pass args to build
docker build -t workshops-app -f development.Dockerfile --build-arg MESSAGE="MESSAGE" .
docker run -p 4567:4567 workshops-app

# docker push
# docker pull

# How to clean leftovers

docker image rm name.../ docker rmi name...

docker image prune # cleans up dangling images. A dangling image is one that is not tagged and is not referenced by any container.

docker image prune -a # remove all images which are not used by existing containers

docker container rm CONTAINER ID.../ docker rm CONTAINER ID...# removes one or more containers
docker container prune # Remove all stopped containers

# how to list images

docker ps # List currently running docker containers:

docker ps --all # List all docker containers (running and stopped)

# how to copy files to the container and from container

docker container cp SOURCE_PATH CONTAINER:SRC_PATH # copies host's source path to given container's source path

docker container cp CONTAINER:SRC_PATH SOURCE_PATH # copies given container's source path to host's source path

Can be shortend with

docker cp

# Run a command in a running container

docker exec CONTAINER ID ls # run a command in a running container
docker exec CONTAINER ID bash


docker -i CONTAINER ID bash # run a command and keeps STDIN open
docker -i -t CONTAINER ID bash # allocates pseudo-TTY

# how to restart a container

docker container restart CONTAINER ID



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

