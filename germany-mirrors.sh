pacman -Syy

pacman -S reflector --noconfirm

reflector --verbose --country 'Germany' -l 20 --sort rate --save /etc/pacman.d/mirrorlist
