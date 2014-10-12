#!/bin/sh
cd "$( dirname "${BASH_SOURCE[0]}" )"

echo "[+] Creating install package"
tar -czf opt.tar.gz opt
cat install.sh opt.tar.gz > mbp-arch.sh

echo "[+] mbp-arch.sh created"
