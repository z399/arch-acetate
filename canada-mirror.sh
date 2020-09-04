pacman -Syy

pacman -S reflector --noconfirm

reflector --verbose --country 'Canada' -l 10 --sort rate --save /etc/pacman.d/mirrorlist
