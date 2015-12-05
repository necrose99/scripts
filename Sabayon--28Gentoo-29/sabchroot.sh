#### Chroot auto for curent Laptop On Sabayon Linux####
Starting Chroot On Live system to Curent Install
# https://wiki.sabayon.org/index.php?title=HOWTO:_chroot_from_a_LiveCD
#
#### Whilst it is possible to mount filesystems from within the chrooted system, 
#### this is not recommended. The reason for this is that the LiveCD/DVD environment 
#### won't know about these mounted systems, so if you forget about them and 
#### leave them mounted when you exit from the chroot environment, 
#### they will not be unmounted properly when the system shuts down, 
#### which could cause damage to the filesystems on those mounts.
##
echo "Danger Will Robenson !!!!DANGER!!!"
echo "Good Luck And Goodspeed"
echo "Falure to Un-chroot can Damage your system; Ye have been WARNED!!"
 mkdir -p /mnt/sabayon/boot
 mount /dev/sdb6 /mnt/sabayon  
 ### mount /dev/sdb5  Hdd for Linux is on HDD2 fat16-MSR boot/UFEI /NTFS data backup /ext3/swap etc.
 swapon /dev/sdb7  ## or swapon -a if you have more or want automatic. 
 echo "Swaps up Baby!!!"
 mount /dev/sdb5 /mnt/sabayon/
 mount -t proc none /mnt/sabayon/proc
 mount -o bind /dev /mnt/sabayon/dev
 mount -o bind /dev /mnt/sabayon/dev
 #mount -o bind /run /mnt/sabayon/run ## lets the resolv.conf quirk this aint in the Sabayon wiki  this dose seem to work. more elegently
 # glitch fixed cuase entropy to lock on chroot as well as live , minor but yet irritating. 
 ### Gentoo is cp /etc/resolv.conf /foo/etc/resolv.conf
 ### WWW. What ? need Rigo to fix Nvidia Driver cluster Fuck again? sometimes the driver updates poorly 
 mount -o bind /tmp /mnt/sabayon/tmp
 chroot /mnt/sabayon /bin/bash
 env-update
 source /etc/profile
 export PS1="(chroot) $PS1"
grep -v rootfs /proc/mounts > /etc/mtab
