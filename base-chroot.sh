ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

hwclock --systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen

echo en_US ISO-8859-1 >> /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 >> /etc/locale.conf 

echo milkyway >> /etc/hostname

passwd 

pacman -S grub efibootmgr networkmanager --noconfirm

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg 

systemctl enable NetworkManager 

useradd -mG wheel nebula

passwd nebula

EDITOR=vim visudo

rm base-chroot.sh



