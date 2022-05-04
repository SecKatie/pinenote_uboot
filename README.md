# Pine64 PineNote U-Boot Bootloader

This repository holds all the required files to build the Pine64 PineNote U-Boot bootloader. 

This bootloader includes fixes for the following issues:

* Error reading https://github.com/DorianRudolph/pinenotes#fix-uboot

## Requirements

### Fedora 35

```bash
$ dnf install -y gcc-aarch64-linux-gnu
$ python -m pip install pyelftools
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
    
    `rkdeveloptool write-partition uboot IMAGES/uboot.img`

3. Write the trust.img to the trust partition:
    
    `rkdeveloptool write-partition trust IMAGES/trust.img`

4. Reboot the Pine64 PineNote:
    
    Remove the pen from the back, turn the device over, and run the following command:
    
    `rkdeveloptool reboot`