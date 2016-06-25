#!/usr/bin/env bash
##############################################
#########  MySQL Percona Server
##############################################
DBPASSWD=root
PERCONA_REPO="/etc/apt/sources.list.d/percona.list"
PERCONA_DEB="deb http://repo.percona.com/apt trusty main"
PERCONA_DEB_SOURCE="deb-src http://repo.percona.com/apt trusty main"

if ! command -v mysql >/dev/null 2>&1; then
	echo "INSTALL MYSQL PERCONA SERVER"
	grep -q -F ${PERCONA_DEB} ${PERCONA_REPO} || echo ${PERCONA_DEB} >> ${PERCONA_REPO}
	grep -q -F ${PERCONA_DEB_SOURCE} ${PERCONA_REPO} || echo ${PERCONA_DEB_SOURCE} >> ${PERCONA_REPO}
	apt-get update
	echo "percona-server-server-5.6 percona-server-server/root_password password $DBPASSWD" | debconf-set-selections
	echo "percona-server-server-5.6 percona-server-server/root_password_again password $DBPASSWD" | debconf-set-selections
	apt-get install -qq -y --force-yes percona-server-server-5.6
fi