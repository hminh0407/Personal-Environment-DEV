#!/bin/bash
DBPASSWD=balance

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

##############################################
#########  ZSH
#############################################
if ! command -v zsh >/dev/null 2>&1; then
    apt-get install zsh
fi

##############################################
#########  MYSQL & PHP-MYADMIN
##############################################

if ! command -v mysql >/dev/null 2>&1; then
    echo "INSTALL MYSQL."
    echo "Using debconf-utils to auto fill the command prompt for Mysql & phpmyadmin setup"
    echo "mysql-server mysql-server/root_password password $DBPASSWD" | debconf-set-selections
	echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/dbconfig-install boolean true" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/app-password-confirm password $DBPASSWD" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/mysql/admin-pass password $DBPASSWD" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/mysql/app-pass password $DBPASSWD" | debconf-set-selections
	echo "phpmyadmin phpmyadmin/reconfigure-webserver multiselect none" | debconf-set-selections
    apt-get -y install mysql-server-5.5 phpmyadmin
fi

##############################################
#########  ORACLE JAVA
##############################################

if ! command -v java >/dev/null 2>&1; then
	echo "INSTALL ORACLE JAVA 8"
	add-apt-repository -y ppa:webupd8team/java
	apt-get update
	apt-get -y upgrade
	echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
	echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
	apt-get -y install oracle-java8-installer
fi

##############################################
#########  ZOOKEEPER
##############################################

echo "INSTALL ZOOKEEPER"
apt-get -y install zookeeperd

##############################################
#########  KAFKA
##############################################

echo "INSTALL KAFKA"
mkdir -p ~/downloads
wget "http://mirror.cc.columbia.edu/pub/software/apache/kafka/0.8.2.1/kafka_2.11-0.8.2.1.tgz" -O ~/downloads/kafka.tgz
mkdir -p ~/kafka && cd ~/kafka
tar -xvzf ~/downloads/kafka.tgz --strip 1
# By default, Kafka doesn't allow you to delete topics. To be able to delete topics, add the following line at the end of the file:
echo 'delete.topic.enable = true' >> ~/kafka/config/server.properties