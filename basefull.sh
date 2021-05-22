ping -c 1 nsa.gov

timedatectl set-ntp true

lsblk

read -p "Drive name (eg: sda,vda,nvme0) : " drive

cfdisk /dev/$drive 

lsblk /dev/$drive && read -p "EFI partition : " efi

read -p "Root partition : " root

#read -p "home partition : " home

mkfs.fat -F32 /dev/$efi 

mkfs.ext4 /dev/$root

#mkfs.ext4 /dev/$home

mount /dev/$root /mnt

mkdir -p /mnt/boot/efi 

#mkdir /mnt/home

mount /dev/$efi /mnt/boot/efi

#mount /dev/$home /mnt/home

model=$(lscpu | grep 'Model name')

case "$model" in
    *Intel*) CPUUCODE="intel-ucode" ;;
    *AMD*) CPUUCODE="amd-ucode";;	
esac

printf "

$CPUUCODE

"

pacstrap /mnt base base-devel linux-lts linux-firmware vim git $CPUUCODE

genfstab -U /mnt >> /mnt/etc/fstab

cp base-chroot.sh /mnt/base-chroot.sh 

chmod +x /mnt/base-chroot.sh

arch-chroot /mnt bash base-chroot.sh && rm /mnt/base-chroot.sh

umount -R /mnt

reboot
