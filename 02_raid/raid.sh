#!/bin/bash

raid_name="md127"

echo "Creating RAID 10 with 4 drives"
sudo lshw -short | grep disk

# for i in {1..4}; do 
#     read -p "chose the disks $i/4 to add in RAID ['sda', 'sdb' ... etc. without '/dev'] : " disk$i
# done

# sudo mdadm --create -l 10 -n 4 $raid_name /dev/$disk1 /dev/$disk2 /dev/$disk3 /dev/$disk4

echo "start creating RAID..."
sudo mdadm --create -l 10 -n 4 $raid_name /dev/sdb /dev/sdc /dev/sdd /dev/sde
sleep 10

echo "RAID information"
sudo mdadm --detail /dev/$raid_name
sleep 3

echo "Creating EXT4 on RAID..."
sudo mkfs.ext4 /dev/$raid_name

echo "Mounting RAID in /mnt/raid..."
sudo mkdir /mnt/raid
sudo mount /dev/$raid_name /mnt/raid

echo "filling RAID with data..."
sudo cp -r /var/log/* /mnt/raid