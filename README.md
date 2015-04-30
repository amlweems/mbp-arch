# mbp-arch
Script to automate basic arch installation for the Macbook Pro

# Usage

1. Edit `chroot_install.sh` as you see fit (modify hostname, install packages, etc.)
2. Run `./build.sh` to generate the install script `mbp-arch.sh`
3. Transfer `mbp-arch.sh` to your target machine (e.g. `nc -l 8080 > mbp-arch.sh`, `nc 1.2.3.4 8080 < mbp-arch.sh`)
4. Run `mbp-arch.sh` on the target machine and reboot!
