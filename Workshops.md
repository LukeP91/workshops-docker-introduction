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
- CLI tool
- company
- containerization platform that simplifies the building, shipment, and running application.
------
## What problems it tries to solve?
- consistent development environment for entire team
- minimize the differecens between local and production environments
- environment is isolated from developer’s OS and other tools
------
## VM vs Container
------
###
![vm](https://nickjanetakis.com/assets/blog/virtual-machine-architecture-e6bcc9d42a12a12da38e92ba5a7ddef21e6bda269abc580a84ece64ac189d2b2.jpg)
------
![docker](https://nickjanetakis.com/assets/blog/docker-architecture-2cf6d2f4a7d8f04df5576d06c46f02435d8fae339063f58a621a42f24255602a.jpg)
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
```
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
docker run --env HELLO="sup guys" \
  -p 4567:4567 workshops-sample-app
```
------
### how to run detached container
```bash
docker run --env HELLO="sup guys" \
  -p 4567:4567 -d workshops-sample-app
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
### How to clean leftovers
```bash
# removes image
docker image rm name...
docker rmi name...
# cleans up dangling images.
docker image prune
# removes one or more containers
docker container rm CONTAINER_ID...
docker rm CONTAINER_ID...
# Remove all stopped containers
docker container prune
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
docker exec CONTAINER_ID ls
docker exec CONTAINER_ID bash
# run a command and keeps STDIN open
docker -i CONTAINER_ID bash
# allocates pseudo-TTY
docker -i -t CONTAINER_ID bash
```
------
### how to restart a container
```bash
docker container restart CONTAINER_ID
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
### leftover running containers
```bash
# Remove containers for services
# not defined in the Compose file.
docker compose up/down --remove-orphans
```
------
### old images
```bash
# remove all images which are
#not used by existing containers
docker image prune -a
```
------
## Useful aliases
*For some of them FZF is required highly recommend installing it*
------
```bash
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
# Thanks
