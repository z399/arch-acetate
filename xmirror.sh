pacman -S reflector --noconfirm

reflector -c Canada -a 6 --sort rate --save /etc/pacman.d/mirrorlist

pacman -Syy
