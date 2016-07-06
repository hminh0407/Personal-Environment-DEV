# Personal-Environment-DEV

Example of using vagrant and docker to setup a dev environment

## Virtualbox provider

### Usages

- Copy or link file vb_provider/Vagrantfile to main folder
- To boot up the whole system: vagrant up

## Docker provider (Default Provider)

### Usages

- Copy or link file docker_provider/Vagrantfile to main folder
- To boot up the whole system: vagrant up
- To boot up a specific container: vagrant up {container_name}
- To enter a running container: docker exec -it {container-name} /bin/bash
- To safely quit docker container: ctrl + p + q

## Components

### MySQL - Percona Server

### RabbitMQ

### Redis

## Windows tutorial

- start up redis (bring up the vb machine for docker host and start redis container)
```bash
$ vagrant up redis
```
- start up postgres (start postgres container on the same docker host)
```bash
$ vagrant up postgres
```
- check vagrant status
```bash
$ vagrant status
Current machine states:

mysql                     not created (docker)
postgres                  running (docker)
rabbitmq                  not created (docker)
redis                     running (docker)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```
- check vagrant global status
```bash
$ vagrant global-status
id       name                provider   state     directory
-----------------------------------------------------------------------------------------------------------------
9a38aab  default             virtualbox running   D:/Workspace/Personal-Environment-DEV/docker_provider
7237f3f  redis               docker     preparing D:/Workspace/Personal-Environment-DEV
2cefeb1  postgres            docker     preparing D:/Workspace/Personal-Environment-DEV
```
- using putty to ssh to virtual machine. (default user/password: vagrant/vagrant)
- check docker status on vb machine
```bash
vagrant@ubuntu-14:~$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
4e2d66061d38        postgres            "/docker-entrypoint.s"   5 hours ago         Up 5 hours          0.0.0.0:5432->5432/tcp   postgres
95c9045d1aa2        redis               "docker-entrypoint.sh"   5 hours ago         Up 5 hours          0.0.0.0:6379->6379/tcp   redis
```
- We should using vb id to manage virtual machine
```bash
$ vagrant suspend 9a38aab
==> default: Saving VM state and suspending execution...
D:/Workspace/Personal-Environment-DEV/Vagrantfile:1: warning: already initialized constant VAGRANTFILE_API_VERSION
D:/Workspace/Personal-Environment-DEV/docker_provider/DockerHostVagrantfile:4: warning: previous definition of VAGRANTFILE_API_VERSION was here
```
- status after suspend
```bash
$ vagrant global-status
id       name                provider   state              directory
--------------------------------------------------------------------------------------------------------------------------
9a38aab  default             virtualbox saved              D:/Workspace/Personal-Environment-DEV/docker_provider
7237f3f  redis               docker     host state unknown D:/Workspace/Personal-Environment-DEV
2cefeb1  postgres            docker     host state unknown D:/Workspace/Personal-Environment-DEV

The above shows information about all known Vagrant environments
on this machine. This data is cached and may not be completely
up-to-date. To interact with any of the machines, you can go to
that directory and run Vagrant, or you can use the ID directly
with Vagrant commands from any directory. For example:
"vagrant destroy 1a2b3c4d"
```