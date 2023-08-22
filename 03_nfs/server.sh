#!/bin/bash

# install nfs server
sudo apt update
sudo apt install nfs-kernel-server -y

# enable nfs server
sudo systemctl start nfs-kernel-server.service

# enable firewall
echo "y" | sudo ufw enable

# firewall settings
ports=(111 2049 635 20048)

sudo ufw allow ssh

for i in ${ports[@]}; do
    sudo ufw allow from 192.168.50.0/24 to any port $i
done

# share settings
sudo mkdir -p /srv/upload
sudo chown nobody:nogroup /srv/upload
sudo chmod 0775 /srv/upload

# nfs server settings
sudo chmod o+w /etc/exports
sudo echo "/srv/upload 192.168.50.11(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports
sudo chmod o-w /etc/exports
sudo exportfs -a
