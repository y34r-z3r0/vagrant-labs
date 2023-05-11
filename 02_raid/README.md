## Problems

### "VERR_ALREADY_EXISTS"
solution: 
1. `vboxmanage list hdds | grep ^UUID`
2. `vboxmanage closemedium <UUID> --delete`

### "Stderr: VBoxManage: error: Too many storage controllers of this type"
solution: 
* using `SAS` instead `SATA`