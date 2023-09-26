## System Boot

### Get into the system without a password №1

unzip `screenshots.zip` to see screenshots

* Screenshot_1: get to the Grub menu using `Fn+F2` 
* Screenshot_2: press `e` key
* Screenshot_3: at the end of the line starting with `Linux` add `init=/bin/sh` and change `ro` to `rw`, then press `ctrl+x`
* Screenshot_4: check write opportunity

### Get into the system without a password №2 & №3 

The options with `rd.break` and `init=/sysroot/bin/sh` don't not work in ubuntu
