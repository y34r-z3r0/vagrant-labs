#!/bin/bash

# install nfs client
sudo apt update
sudo apt install nfs-common -y

# enable firewall
echo "y" | sudo ufw enable
sudo ufw allow ssh

# share settings
sudo mkdir /mnt/nfs
sudo mount 192.168.50.10:/srv/upload /mnt

# enable nfs client
sudo systemctl start nfs-utils.service

# persist nfs share
sudo chmod 777 /etc/fstab 
sudo echo "192.168.56.10:/srv/upload/ /mnt nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab
sudo chmod 644 /etc/fstab 

# restart services
sudo systemctl daemon-reload
sudo systemctl restart remote-fs.target