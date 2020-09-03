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

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

hwclock --systohc

vim /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 >> /etc/locale.conf 

echo Arch Linux >> /etc/hostname

passwd 

pacman -S grub efibootmgr networkmanager

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg 

systemctl enable NetworkManager 

useradd -mG wheel nebula

passwd nebula

EDITOR=vim visudo

exit

umount -R /mnt

reboot


















 










