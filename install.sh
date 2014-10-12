#!/bin/sh
cd "$( dirname "${BASH_SOURCE[0]}" )"

echo "[!] Create partition table (e.g. cgdisk)"
echo "[!] Create file systems (e.g. mkfs.ext4 /dev/sda3)"
echo "[!] Mount file systems (e.g. mount /dev/sda3 /mnt)"
echo "[!] Type 'exit' when done."
/bin/sh

echo "[+] Initializing arch base"
pacstrap /mnt base base-devel

echo "[+] Create fstab"
genfstab -p /mnt >> /mnt/etc/fstab

echo "[+] Extracting files into $(pwd)"
# searches for the line number where finish the script and start the tar.gz
SKIP=`awk '/^__TARFILE_FOLLOWS__/ { print NR + 1; exit 0; }' $0`
THIS="$( basename "${BASH_SOURCE[0]}" )"
echo $SKIP $THIS
tail -n +$SKIP $THIS | tar -xzv -C /mnt/

echo "[+] Jump in to the chroot'd environment"
arch-chroot /mnt /opt/mbp/chroot_install.sh

echo "[+] Your Arch installation is ready"
exit 0

# DO NOT MODIFY ANYTHING BELOW THIS POINT
__TARFILE_FOLLOWS__
