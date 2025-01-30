#!/bin/bash

set -euo pipefail

echo "Installing additional core packages"
pacman -Syu --noconfirm bash-completion ed efibootmgr fwupd htop ibus libblockdev-lvm \
    lsof pacman-contrib smartmontools tldr udisks2-lvm2 util-linux \
    wget xdg-utils usbutils git neofetch
echo "" 