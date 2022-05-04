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

## Usage

### Build

```bash
$ git clone --recurse-submodules https://github.com/JoshuaMulliken/pinenote_uboot.git
$ cd pinenote_uboot
$ ./build.sh
```

### Install

1. Boot the Pine64 PineNote into download mode. [instructions](https://github.com/DorianRudolph/pinenotes#download-mode)

2. Write the U-Boot bootloader to the uboot partition:
    
    `rkdeveloptool write-partition uboot IMAGES/uboot.img`

3. Write the trust.img to the trust partition:
    
    `rkdeveloptool write-partition trust IMAGES/trust.img`

4. Reboot the Pine64 PineNote:
    
    Remove the pen from the back, turn the device over, and run the following command:
    
    `rkdeveloptool reboot`

## Changing default boot order

Boot order is managed on line 95 of the [`u-boot-rockchip/include/configs/rk3568_common.h`](u-boot-rockchip/include/configs/rk3568_common.h#L95) file.

```c
#undef RKIMG_BOOTCOMMAND
#define RKIMG_BOOTCOMMAND \
	"boot_fit;"	\
	"boot_android ${devtype} ${devnum};" \
	"run distro_bootcmd;"
```

This can be changed to boot a linux distro using extlinux first if desired.

```c
#undef RKIMG_BOOTCOMMAND
#define RKIMG_BOOTCOMMAND		\
    "boot_fit;"			\
    "run distro_bootcmd;" \
    "boot_android ${devtype} ${devnum};"
```

A suitable extlinux.conf file can then be made and placed in the `/boot` directory of your linux installation.

```conf
timeout 10
default MAINLINE
menu title boot prev kernel

label MAINLINE
  kernel /vmlinuz
  fdt /rk3566-pinenote.dtb
  initrd /initramfs
  append earlycon console=tty0 console=ttyS2,1500000n8 fw_devlink=off PMOS_NO_OUTPUT_REDIRECT
```