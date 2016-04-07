#!/bin/bash


##############################################
#########  SUPERVISOR
##############################################

if ! command -v supervisorctl >/dev/null 2>&1; then
    echo "INSTALL SUPERVISOR"
    apt-get update
    apt-get -y install supervisor
fi

##############################################
#########  ZSH
#############################################
if ! command -v zsh >/dev/null 2>&1; then
    apt-get install zsh
fi

##############################################
#########  MYSQL
##############################################

if ! command -v mysql >/dev/null 2>&1; then
    echo "INSTALL MYSQL"
    apt-get update
    apt-get -y install mysql-server-5.5
fi