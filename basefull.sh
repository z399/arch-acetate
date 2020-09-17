pacman -Syy

ping -c 1 protonmail.com

timedatectl set-ntp true

cfdisk

mkfs.fat -F32 /dev/sda1 

mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt 

mkdir -p /mnt/boot/efi 

mount /dev/sda1 /mnt/boot/efi

pacman -Syy

pacstrap /mnt base base-devel linux linux-firmware vim git

genfstab -U /mnt >> /mnt/etc/fstab

cp base-chroot.sh /mnt/base-chroot.sh 

chmod +x /mnt/base-chroot.sh

arch-chroot /mnt bash base-chroot.sh && rm /mnt/base-chroot.sh

umount -R /mnt

reboot

