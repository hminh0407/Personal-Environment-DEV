#!/bin/bash

##############################################
#########  PREPARATION
##############################################
echo "apt-get update and install neccessary tools"
apt-get -y upgrade
apt-get install -y wget #tcpdump netcat telnet dstat
# install debconf-utils for command prompt automation
apt-get install debconf-utils -y > /dev/null

##############################################
#########  SUPERVISOR
##############################################

if ! command -v supervisorctl >/dev/null 2>&1; then
    echo "INSTALL SUPERVISOR"    
    apt-get -y install supervisor
fi

SYNCED_FOLDER=/srv/general/dev
CONFIG_FOLDER=${SYNCED_FOLDER}/config

# Add the needed modules here
# . ${CONFIG_FOLDER}/redis/redis.sh