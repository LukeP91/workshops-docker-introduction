# Docker introduction
------
## Goals
- Explain basic ideas behind docker
- Teach basic and most commonly used commands
- Teach about docker-compose and basic commands related to it
- Show common issues and how to handle them
- Show a couple of useful shell aliases
------
## Rules
- Tell me if I need to repeat something or when I am going to fast
- Ask questions
------
## Docker - what is it?
------
## What problems it tries to solve?
------
## VM vs Container
------
## Dockerfile vs Docker image vs Docker container
------
### Dockerfile
- a receipe which tells docker how to build an image
------
### Docker image
- read-only template
- contains layers of libraires, packages and source code
- can be shared in public/private registry
------
### Docker container
- instance of a docker container
- adds writable layer to the docker image
- more than one container can be created from an image
------
## Docker Hub
- think like Github for docker images
- place to share container docker images
- docker pull get's an image from here by default
- hub.docker.com
------
## Basic commands
------
### how to run image
```bash
docker run workshops-sample-app
```
------
### how to bind port
```bash
docker run -p 4567:4567 workshops-sample-app
```
------
### how to give name to the container
```bash
docker run --name web -p 4567:4567 workshops-sample-app
```
------
### how to pass env
```bash
docker run --env HELLO="sup guys" --name web -p 4567:4567 workshops-sample-app
```
------
### how to run detached container
```bash
docker run --env HELLO="sup guys" --name web -p 4567:4567 -d workshops-sample-app
```
------
### how to build image
```bash
docker build
```
------
### how to build non default dockerfile
```bash
docker build -f ./Dockerfile.development
```
------
### how to run build without cache
```bash
docker build --no-cache
```
------
### how to tag build
```bash
docker build --tag
```
------
### how to pass args to build
```bash
docker build -t workshops-app -f development.Dockerfile \
  --build-arg MESSAGE="MESSAGE" .
docker run -p 4567:4567 workshops-app
```
------
### docker push
------
### docker pull
------
### How to clean leftovers
```bash
docker image rm name.../ docker rmi name...
# cleans up dangling images.
docker image prune
# removes one or more containers
docker container rm CONTAINER ID.../ docker rm CONTAINER ID...
# Remove all stopped containers
docker container prune
```
------
### how to list images
```bash
# List currently running docker containers:
docker ps
# List all docker containers (running and stopped)
docker ps --all
```
------
### how to copy files to the container and from container
```bash
# copies host's source path to given container's source path
docker container cp SOURCE_PATH CONTAINER:SRC_PATH
# copies given container's source path to host's source path
docker container cp CONTAINER:SRC_PATH SOURCE_PATH
# Can be shortend with
docker cp
```
------
### Run a command in a running container
```bash
# run a command in a running container
docker exec CONTAINER ID ls
docker exec CONTAINER ID bash
# run a command and keeps STDIN open
docker -i CONTAINER ID bash
# allocates pseudo-TTY
docker -i -t CONTAINER ID bash
```
------
### how to restart a container
```bash
docker container restart CONTAINER ID
```
------
## Docker-compose
------
### What is a docker-compose

### Commands
```bash
# Build or rebuild services
docker compose build
# Build services with no cache
docker compose build --no-cache
# Create and start containers
docker compose up
# Detached mode: Run containers in the background
docker compose up -d
# Stop and remove containers, networks
docker compose down
# Removes stopped service containers
docker compose rm
```
------
## Common issues and how to handle them
------
### .dockerignore
- works sort of like `.gitignore`
- allows you to exclude files from context
- worth to have one
------
### cache
-

------
### leftover running containers
```bash
# Remove containers for services not defined in the Compose file.
docker compose up/down ----remove-orphans
```
------
### old images
```bash
# remove all images which are not used by existing containers
docker image prune -a
```
------
## Useful aliases
*For some of them FZF is required and I highly recommend installing it*
------
```shell
# list running containers and runs sh for the selected one
alias dsh='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) sh'
# list running containers and runs bash for the selected one
alias dbash='docker exec -it $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  ) bash'
# list running containers and restarts selected one
alias dcrestart='compose_file=$(ls | grep docker-compose.yml | fzf); service=$(docker-compose -f $compose_file ps --service | fzf); docker-compose -f $compose_file restart $service'
# list running containers and kills selected one
alias dk='docker kill $(  docker ps | fzf | awk '"'"'{print $1;}'"'"'  )'
```
------
