#!/bin/bash
echo "[+] Installing tools"
pacman --noconfirm -S grub-efi-x86_64 openssh wget vim git nmap

echo "[+] Installing yaourt"
pacman --noconfirm -U /opt/mbp/package-query-1.4-1-x86_64.pkg.tar.xz
pacman --noconfirm -U /opt/mbp/yaourt-1.5-1-any.pkg.tar.xz

echo "[+] Installing AUR packages"
yaourt --noconfirm -S b43-firmware

echo "[+] Setting up persistence"
systemctl daemon-reload
systemctl enable dhcpcd
systemctl enable sshd

echo "[+] Setting up basic arch environment"
echo javelin > /etc/hostname
hwclock --systohc --utc
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 >> /etc/locale.conf
export LANG=en_US.UTF-8

echo "[+] Running mkinitcpio (this is very important)"
mkinitcpio -p linux

echo "[+] Setting up grub"
mkdir -p /boot/efi/System/Library/CoreServices/
grub-mkconfig -o /boot/grub/grub.cfg
grub-mkstandalone -o /boot/efi/System/Library/CoreServices/boot.efi -d /usr/lib/grub/x86_64-efi -O x86_64-efi /boot/grub/grub.cfg

rm -rf /opt/mbp
exit 0