# Problems

## "VERR_ALREADY_EXISTS"
solution: 
1. `vboxmanage list hdds | grep ^UUID`
2. `vboxmanage closemedium <UUID> --delete`

## "Stderr: VBoxManage: error: Too many storage controllers of this type"
solution: 
* using `SAS` instead `SATA`

# Notes

## Сreate a logical partition

list of disks
```
sudo lshw -short | grep disk
```

detailed information of disks
```
sudo fdisk -l
```

detailed information about chosen disk
```
sudo fdisk -l /dev/sda1
```


## Create raid-array

raid-arrays info 1
```
cat /proc/mdstat
```

create raid-array 10 with 4 disks
```
sudo mdadm --create -l 10 -n 4 <name> /dev/sda1 /dev/sda2 /dev/sda3 /dev/sda4
```

raid-arrays info 2
```
sudo mdadm --detail /dev/<name>
```

create ext4 file system
```
sudo mkfs.ext4 /dev/<name>
```

sudo mount disk with raid-array 
```
sudo mount /dev/<name> /mnt/<name>
```

check disk mount
```
df -hT
```

filling disk with data
```
sudo cp -r /var/log/* /mnt/<name>
```

## Break the raid-array

```
mdamd --manage /dev/<name> --fail /dev/sda2
```

remove failed disk from array
```
mdadm --manage /dev/<name> --remove /dev/sda2
```

add new disk to array
```
mdadm --manage /dev/<name> --add /dev/sda5
```