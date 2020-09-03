ping protonmail.com 

timedatectl set-ntp true

cfdisk

mkfs.fat -F32 /dev/sda1 

mkfs.ext4 /dev/sda2

mount /dev/sda2 /mnt 

mkdir -p /mnt/boot/efi 

mount /dev/sda1 /mnt/boot/efi 

pacman -Syy

pacstrap /mnt base base-devel linux linux-firmware vim

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt 
