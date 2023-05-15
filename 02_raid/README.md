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

please stand by.. (use fdisk)

## Create raid-array

raid-arrays info 1
```
cat /proc/mdstat
```

create raid-array 10 with 4 disks
```
mdadm --create -l 10 -n 4 <name> /dev/sda1 /dev/sda2 /dev/sda3 /dev/sda4
```

raid-arrays info 2
```
mdadm --detail /dev/<name>
```

create ext4 file system
```
mkfs.ext4 /dev/<name>
```

mount disk with raid-array 
```
mount /dev/<name> /mnt/<name>
```

check disk mount
```
df -hT
```

filling disk with data
```
cp -r /var/log/* /mnt/<name>
```

## Break the raid-array

```
mdamd --manage /dev/<name> --fail /dev/sda2
```

remove failed disk from array
```
mdamd --manage /dev/<name> --remove /dev/sda2
```

add new disk to array
```
mdamd --manage /dev/<name> --add /dev/sda5
```