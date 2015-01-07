#!/bin/bash 

# Cai dat Salt cho Mininon - Ubuntu

echo "###### Nhap IP cua may MASTER ######"
read IP_MASTER

apt-get update

apt-get -y install python-software-properties
add-apt-repository ppa:saltstack/salt -y
apt-get update
apt-get -y install salt-minion

sed -i "s/#master: salt/master: $IP_MASTER/g" /etc/salt/minion

service salt-minion restart 

echo "##### Da cai dat xong salt cho Minion ######"