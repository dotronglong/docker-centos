#!/bin/bash
cp -pr /vagrant/selinux /etc/sysconfig/selinux

yum update -y
yum install -y wget git yum-utils

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum-config-manager --enable docker-ce-edge

yum makecache fast
yum install -y docker-ce

curl -L "https://github.com/docker/compose/releases/download/1.12.0/docker-compose-$(uname -s)-$(uname -m)" \
 -o /usr/bin/docker-compose
chmod +x /usr/bin/docker-compose

usermod -aG docker vagrant
