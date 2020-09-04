pacman -Syy

pacstrap /mnt base base-devel linux linux-firmware vim git

genfstab -U /mnt >> /mnt/etc/fstab

cp base-chroot.sh /mnt/home/base-chroot.sh

chmod +x /mnt/home/base-chroot.sh

arch-chroot /mnt
