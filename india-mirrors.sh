pacman -S reflector --noconfirm

reflector --verbose --country 'India' -l 10 --sort rate --save /etc/pacman.d/mirrorlist
