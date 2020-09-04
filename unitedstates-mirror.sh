pacman -Syy

pacman -S reflector --noconfirm

reflector --verbose --country 'United States' -l 25 --sort rate --save /etc/pacman.d/mirrorlist
