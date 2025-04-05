# How-to Mount Storage Devices on a Linux Machine

## Description

This shows how to mount the storage devices on a Linux machine.
We use Michael Stumm's Intel 2023 lab machine as an example

## Mounting Disks

Use `lsblk` to view the block storage devices. [source](https://unix.stackexchange.com/questions/49786/finding-all-storage-devices-attached-to-a-linux-machine)

```bash
$ lsblk
NAME                      MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
loop0                       7:0    0     4K  1 loop /snap/bare/5
loop1                       7:1    0  73.9M  1 loop /snap/core22/1748
loop2                       7:2    0  73.9M  1 loop /snap/core22/1802
loop3                       7:3    0 258.3M  1 loop /snap/firefox/5917
loop4                       7:4    0 258.3M  1 loop /snap/firefox/5947
loop5                       7:5    0 505.1M  1 loop /snap/gnome-42-2204/176
loop6                       7:6    0   516M  1 loop /snap/gnome-42-2204/202
loop7                       7:7    0  91.7M  1 loop /snap/gtk-common-themes/1535
loop8                       7:8    0  44.4M  1 loop /snap/snapd/23545
loop9                       7:9    0  44.4M  1 loop /snap/snapd/23771
loop11                      7:11   0 210.8M  1 loop /snap/thunderbird/684
loop12                      7:12   0 210.5M  1 loop /snap/thunderbird/702
sda                         8:0    0    20T  0 disk 
nvme0n1                   259:0    0   7.3T  0 disk 
└─nvme0n1p1               259:1    0   7.3T  0 part 
nvme1n1                   259:2    0   1.8T  0 disk 
├─nvme1n1p1               259:3    0     1G  0 part /boot/efi
├─nvme1n1p2               259:4    0     2G  0 part /boot
└─nvme1n1p3               259:5    0   1.8T  0 part 
  └─ubuntu--vg-ubuntu--lv 252:0    0   1.8T  0 lvm  /var/snap/firefox/common/host-hunspell
```

These devices are stored under `/dev/`.

Use `sudo mount <device> <path>` to mount a device on a certain path.
Specifically, mount the partition.

```bash
$ sudo mount /dev/sda /mnt/disk1-20tb
$ sudo mount /dev/nvme0n1p1 /mnt/disk2-8tb
```
