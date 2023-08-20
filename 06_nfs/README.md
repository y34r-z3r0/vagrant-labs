
### Note!
```
$ sudo systemctl status nfs-kernel-server.service

...
Active: active (exited) since Sun ****-**-** **:**:** UTC; **min ago
...
```
The only job of the `rpc.nfsd` program is to ask the kernel to start the NFS server kthreads – but those are not associated with the original rpc.nfsd process in any way, and will continue to run even after the process exits.

So the systemd .service's behavior is correct (well, it's the best it can do). It is similar to "starting" iptables or nftables, both of which have no userspace daemon.

To check whether the kernel NFS server is actually running, run `ps axf` or htop and search for kthreads named `nfsd`. You can also check information found in `/proc/fs/nfsd`


### NFS debuging
```
cat /var/log/syslog | grep NFS
```