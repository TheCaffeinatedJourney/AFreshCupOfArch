#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/utils.sh"

echo "Installing and configuring bluetooth..."
pacman -S --noconfirm bluez bluez-utils

if ! lsmod | grep -q "^btusb"; then
    modprobe btusb
fi

systemctl enable --now bluetooth.service

local groupname="lp"
echo "Users must be added to the $groupname group if they will be connecting to a bluetooth tether." 
manage_group_membership "$groupname"
echo "" 