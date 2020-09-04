pacman -Syy

pacman -S reflector

reflector --verbose --country 'India' -l 10 --sort rate --save /etc/pacman.d/mirrorlist

ping -c 3 protonmail.com

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

cp base-chroot.sh /mnt/home/base-chroot.sh

chmod +x /mnt/home/base-chroot.sh

arch-chroot /mnt 
