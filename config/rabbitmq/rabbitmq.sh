#!/usr/bin/env bash
##############################################
#########  RabbitMQ
##############################################

# Ports need to be forwarded:
# 5672 - queue server
# 15672 - admin tool
RABBITMQ_REPO="/etc/apt/sources.list.d/rabbitmq.list"
RABBITMQ_DEB="deb http://www.rabbitmq.com/debian/ testing main"

if ! command -v rabbitmq-server >/dev/null 2>&1; then
	echo "INSTALL RABBITMQ"
	grep -q -F $RABBITMQ_DEB $RABBITMQ_REPO || echo $RABBITMQ_DEB >> $RABBITMQ_REPO
	# add the RabbitMQ public key to our trusted key list to avoid any warnings about unsigned packages
	wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
	apt-key add rabbitmq-signing-key-public.asc
	apt-get update
	apt-get install -qq -y --force-yes rabbitmq-server
fi

# Enable Plugins
rabbitmq-plugins enable rabbitmq_management

# Restart service
service rabbitmq-server restart