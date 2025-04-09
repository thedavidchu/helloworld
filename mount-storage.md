# How-to Mount Storage Devices on a Linux Machine

## Description

This shows how to mount the storage devices on a Linux machine.
We use Michael Stumm's Intel 2023 lab machine as an example.

We need to remount the storage after we reboot machines.

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

After these changes, we run `lsblk` again, we should see the devices successfully mounted.

```
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
sda                         8:0    0    20T  0 disk /mnt/disk1-20tb
nvme0n1                   259:0    0   7.3T  0 disk 
└─nvme0n1p1               259:1    0   7.3T  0 part /mnt/disk2-8tb
nvme1n1                   259:2    0   1.8T  0 disk 
├─nvme1n1p1               259:3    0     1G  0 part /boot/efi
├─nvme1n1p2               259:4    0     2G  0 part /boot
└─nvme1n1p3               259:5    0   1.8T  0 part 
  └─ubuntu--vg-ubuntu--lv 252:0    0   1.8T  0 lvm  /var/snap/firefox/common/host-hunspell
                                                    /
```

or

```bash
$ df
Filesystem                          1K-blocks        Used  Available Use% Mounted on
tmpfs                                13163616        2160   13161456   1% /run
efivarfs                                  192         159         29  85% /sys/firmware/efi/efivars
/dev/mapper/ubuntu--vg-ubuntu--lv  1919113944   765571768 1074445660  42% /
tmpfs                                65818072          28   65818044   1% /dev/shm
tmpfs                                    5120           8       5112   1% /run/lock
/dev/nvme1n1p2                        1992552      296036    1575276  16% /boot
/dev/nvme1n1p1                        1098632        6284    1092348   1% /boot/efi
tmpfs                                13163612          96   13163516   1% /run/user/124
tmpfs                                13163612          84   13163528   1% /run/user/1003
/dev/sda                          21398778964 18955394372 1369102096  94% /mnt/disk1-20tb
/dev/nvme0n1p1                     7751271852  6967201252  393352956  95% /mnt/disk2-8tb
```
