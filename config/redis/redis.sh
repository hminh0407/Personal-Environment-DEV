#!/usr/bin/env bash
##############################################
#########  Redis
##############################################

if ! command -v redis-server >/dev/null 2>&1; then
	echo "INSTALL REDIS"
	apt-get install -qq -y --force-yes redis-server
fi