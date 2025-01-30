#!/bin/bash

set -euo pipefail

echo "Installing and configuring util-linux..."
pacman -S --noconfirm util-linux

systemctl enable fstrim.timer
echo "" 