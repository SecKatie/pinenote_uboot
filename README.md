# Pine64 PineNote U-Boot Bootloader

This repository holds all the required files to build the Pine64 PineNote U-Boot bootloader. 

This bootloader includes fixes for the following issues:

* Error reading https://github.com/DorianRudolph/pinenotes#fix-uboot

## Requirements

### Ubuntu 18.04 LTS or newer.

```bash
$ sudo apt-get install git-core gnupg flex bison \
       build-essential zip curl zlib1g-dev gcc-multilib \
       g++-multilib libc6-dev-i386 libncurses5 \
       lib32ncurses5-dev x11proto-core-dev libx11-dev \ 
       lib32z1-dev libgl1-mesa-dev libxml2-utils \
       xsltproc unzip fontconfig
```

### Fedora 35

```bash
$ dnf install @development-tools android-tools \
	          automake bison bzip2 bzip2-libs \
              ccache curl dpkg-dev gcc gcc-c++ \
	          gperf libstdc++.i686 libxml2-devel \
	          lz4-libs lzop make maven \
              ncurses-compat-libs openssl-devel \
              openssl pngcrush python python3 \
              python3-mako python-mako python-networkx \
              schedtool squashfs-tools syslinux-devel \
              zip zlib-devel zlib-devel.i686
```

## Build

```bash
$ git clone --recurse-submodules https://github.com/JoshuaMulliken/pinenote_uboot.git
$ cd pinenote_uboot
$ ./build.sh
```

## Install

1. Boot the Pine64 PineNote into download mode. [instructions](https://github.com/DorianRudolph/pinenotes#download-mode)

2. Write the U-Boot bootloader to the uboot partition:
    
    `rkdeveloptool write-partition uboot IMAGE/uboot.img`

3. Write the trust.img to the trust partition:
    
    `rkdeveloptool write-partition trust IMAGE/trust.img`

4. Reboot the Pine64 PineNote:
    
    Remove the pen from the back, turn the device over, and run the following command:
    
    `rkdeveloptool reboot`