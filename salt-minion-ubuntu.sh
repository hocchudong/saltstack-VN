#!/bin/bash 

# Cai dat Salt cho Mininon - Ubuntu

apt-get update

apt-get -y install python-software-properties
add-apt-repository ppa:saltstack/salt -y
apt-get update
apt-get -y install salt-minion

sed -i 's/#master: salt/master: 172.16.69.21/g' /etc/salt/minion

service salt-minion restart 

echo "Da cai dat xong salt cho Minion"