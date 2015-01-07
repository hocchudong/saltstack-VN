#!/bin/bash 
# Chuong trinh cai dat SaltStack tren may Master

apt-get update

apt-get -y install python-software-properties
add-apt-repository ppa:saltstack/salt -y
apt-get update
apt-get -y install salt-master

