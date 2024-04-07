# Vagrant CLI

docs: https://developer.hashicorp.com/vagrant/docs

## Usage

#### deploy/up vm:
```
vagrant up
```

#### connect to vm:
```
vagrant ssh
```

#### reload vm (required for changes made in the Vagrantfile to take effect):
```
vagrant reload
```

#### shutdown vm:
```
vagrant halt
```

#### delete vm:
```
vagrant destroy -f
```

# VirtualBox CLI

docs: https://www.oracle.com/technical-resources/articles/it-infrastructure/admin-manage-vbox-cli.html

## Usage

### vms list:
```
vboxmanage list vms
```
or
```
vboxmanage list runningvms
```

### shutdown vm:

Gracefull shutdown
```
vboxmanage controlvm <vm_name> acpipowerbutton
```

Hard shutdown
```
vboxmanage controlvm <vm_name> poweroff
```

### start vm:
```
vboxmanage startvm <vm_name>
```