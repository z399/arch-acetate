read -p "Enter Hostname : " HOSTNAME 


read -p "Enter Username: " USERNAME


clear


printf '
Africa/Abidjan 
Africa/Casablanca
America/Adak 
America/Los_Angeles 
Antarctica/Casey  
Antarctica/Vostok
Asia/Kolkata 
Asia/Tokyo 
Atlantic/Bermuda 
Atlantic/Reykjavik
Australia/Lord_Howe 
Australia/Melbourne
Europe/Amsterdam 
Europe/Istanbul
Indian/Kerguelen
Indian/Reunion
Pacific/Chuuk 
Pacific/Wake
UTC

'

read -p "Enter Timezone: " TIMEZONE 

read -p "Swap File size in Megabytes (eg: 1024,2048,4096,8192) : " SWFS 

/bin/echo -e '\n\n' "\e[1;32mGENERATING SWAPFILE.........\e[0m"

dd if=/dev/zero of=/swapfile bs=1M count=${SWFS} status=progress

chmod 600 /swapfile

mkswap /swapfile

swapon /swapfile

echo  "/swapfile	none	swap	defaults	0 0" >> /etc/fstab

ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime

hwclock --systohc

echo en_US.UTF-8 UTF-8 >> /etc/locale.gen

echo en_US ISO-8859-1 >> /etc/locale.gen

locale-gen

echo LANG=en_US.UTF-8 >> /etc/locale.conf 

echo $HOSTNAME >> /etc/hostname

passwd 

pacman -Sy grub efibootmgr networkmanager zsh zsh-syntax-highlighting zsh-autosuggestions --needed --noconfirm

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB

grub-mkconfig -o /boot/grub/grub.cfg 

systemctl enable NetworkManager 

useradd -mG wheel -s /bin/zsh $USERNAME

passwd $USERNAME

echo "root ALL=(ALL) ALL 
%wheel ALL=(ALL) ALL 
@includedir /etc/sudoers.d" > /etc/sudoers

exit
