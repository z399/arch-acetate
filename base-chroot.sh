read -p "Enter Hostname : " hostname 


read -p "Enter Username: " username


/bin/echo -e '\n\n' "\e[1;32mGENERATING SWAPFILE.........\e[0m"

sleep 1

dd if=/dev/zero of=/swapfile bs=1G count=1 status=progress

chmod 600 /swapfile

mkswap /swapfile

swapon /swapfile

echo  "/swapfile	none	swap	defaults	0 0" >> /etc/fstab

ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

hwclock --systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen

echo en_US ISO-8859-1 >> /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 >> /etc/locale.conf 

echo $hostname >> /etc/hostname

passwd 

pacman -Sy grub efibootmgr networkmanager zsh zsh-syntax-highlighting zsh-autosuggestions --needed --noconfirm

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg 

systemctl enable NetworkManager 

useradd -mG wheel -s /bin/zsh nebula 

passwd $username

echo "root ALL=(ALL) ALL 
%wheel ALL=(ALL) ALL 
@includedir /etc/sudoers.d" > /etc/sudoers

exit
