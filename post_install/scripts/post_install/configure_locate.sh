#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/utils.sh"

echo "Installing and configuring locate..."
pacman -S --noconfirm locate
conf="/etc/updatedb.conf"
sed -i 's|\(PRUNEPATHS = ".*\)"|\1 /backup"|' "$conf"

local groupname="locate"
echo "Users must be added to the $groupname group to allow administration of locate"
manage_group_membership "$groupname"
echo "" 