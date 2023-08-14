#!/bin/bash

# install zfs repo
yum install -y http://download.zfsonlinux.org/epel/zfs-release.el7_8.noarch.rpm

# import gpg key 
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-zfsonlinux

# install DKMS style packages for correct work ZFS
yum install -y epel-release kernel-devel zfs

# change ZFS repo
yum-config-manager --disable zfs
yum-config-manager --enable zfs-kmod
yum install -y zfs

# add kernel module zfs
modprobe zfs

# install wget
yum install -y wget

# create zfs pools
zpool create otus1 mirror /dev/sdb /dev/sdc
zpool create otus2 mirror /dev/sdd /dev/sde
zpool create otus3 mirror /dev/sdf /dev/sdg
zpool create otus4 mirror /dev/sdh /dev/sdi

# set compressions
zfs set compression=lzjb otus1
zfs set compression=lz4 otus2
zfs set compression=gzip-9 otus3
zfs set compression=zle otus4

# get test log file for 1 task
for i in {1..4}; do 
    wget -P /otus$i https://gutenberg.org/cache/epub/2600/pg2600.converter.log 
done

# get data for task 2
wget -O archive.tar.gz --no-check-certificate 'https://drive.google.com/u/0/uc?id=1KRBNW33QWqbvbVHa3hLJivOAt60yukkg&export=download'

# get data fot task 3
wget -O otus_task2.file --no-check-certificate "https://drive.google.com/u/0/uc?id=1gH8gCL9y7Nd5Ti3IRmplZPF1XjzxeRAG&export=download"