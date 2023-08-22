
# NFS

docs: https://ubuntu.com/server/docs/service-nfs

## TODO for scripts

- [X] Server
- [X] Client
- [ ] Dedicated LVM for sharing directory on server
- [ ] Kerberos

## Server

### Install and managing NFS server
Install:
```
sudo apt update && sudo apt install nfs-kernel-server -y
```
Managing:
```
sudo systemctl {start|stop|restart|status} nfs-kernel-server.service
```
### Shared directory
Create and setting:
```
sudo mkdir -p /srv/upload/
```
```
sudo chown nobody:nogroup /srv/upload/
```
```
sudo chmod 0775 /srv/upload/
```

### Server configuration
Main configuration file
```
sudo echo "/srv/upload/ 192.168.50.10(rw,sync,no_subtree_check,no_root_squash)" >> /etc/exports
```

For detailed information about options see `man exports`

Apply changes:
```
sudo exportfs -a
```

Check directory availability
```
sudo exportfs
```

# Client

### Install and managing NFS client
```
sudo apt update && sudo apt install nfs-common -y
```

### Mount point
Check available mount points on NFS server:
```
sudo showmount --exports 192.168.50.10
```

Manual mount:
```
sudo mount 192.168.50.10:/srv/upload /mnt
```

Auto mount:
```
sudo echo "192.168.50.10:/srv/upload/ /mnt nfs auto,nofail,noatime,nolock,intr,tcp,actimeo=1800 0 0" >> /etc/fstab
```
```
sudo systemctl daemon-reload
```
```
sudo systemctl restart remote-fs.target
```

Check mount:
```
sudo findmnt -t nfs4
```

```
df -hT
```