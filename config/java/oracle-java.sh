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