# Personal-Environment-DEV

Example of using vagrant and docker to setup a dev environment

## Virtualbox provider

### Usages

- Copy or link file vb_provider/Vagrantfile to main folder
- To boot up the whole system: vagrant up

## Docker provider

### Usages

- Copy or link file docker_provider/Vagrantfile to main folder
- To boot up the whole system: vagrant up
- To boot up a specific container: vagrant up {container_name}
- To enter a running container: docker exec -it {container-name} /bin/bash
- To safely quit docker container: ctrl + p + q

### Components

## MySQL - Percona Serv

## RabbitMQ

## Redis