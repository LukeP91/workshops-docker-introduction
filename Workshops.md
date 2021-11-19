# Docker introduction

## Goals

- Explain basic ideas behind docker
- Teach basic and most commonly used commands
- Teach about docker-compose and basic commands related to it
- Show common issues and how to handle them
- Show a couple of useful shell aliases

## Rules

- Tell me if I need to repeat something or am going to fast
- Ask questions

## Docker what is it?

- vm vs container
- 

## Basic commands

- docker pull
- docker run
- docker build
- docker push
- docker container ls/rm/cp/kill/prune/exec/logs/
- docker image build/ls/prune/pull/rm
- docker pull/build/cp/exec/images/kill/logs/ps/restart/rm/rmi/run/

## Docker-compose

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

