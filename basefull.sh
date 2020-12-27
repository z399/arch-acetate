ping -c 1 nsa.gov

timedatectl set-ntp true

read -p "Drive name (eg: /dev/sda) : " drive

cfdisk $drive 

lsblk $drive && read -p "EFI partition : " efi

read -p "root partition : " root

#read -p "home partition : " home

mkfs.fat -F32 /dev/$efi 

mkfs.ext4 /dev/$root

#mkfs.ext4 /dev/$home

mount /dev/$root /mnt

mkdir -p /mnt/boot/efi 

#mkdir /mnt/home

mount /dev/$efi /mnt/boot/efi

#mount /dev/$home /mnt/home

pacstrap /mnt base base-devel linux-hardened linux-firmware vim git #amd-ucode intel-ucode

genfstab -U /mnt >> /mnt/etc/fstab

cp base-chroot.sh /mnt/base-chroot.sh 

chmod +x /mnt/base-chroot.sh

arch-chroot /mnt bash base-chroot.sh && rm /mnt/base-chroot.sh

umount -R /mnt

reboot
