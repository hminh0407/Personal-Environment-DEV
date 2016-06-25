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