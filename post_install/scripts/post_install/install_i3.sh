#!/bin/bash

set -euo pipefail

project_root=$(realpath "$(dirname "$0")/../..")

echo "Installing i3 window manager..."
pacman -S --noconfirm i3-wm i3lock i3status dmenu picom polybar

cp -r "$project_root/assets/i3" "$HOME/.config/"
cp -r "$project_root/assets/i3status" "$HOME/.config/"
echo "" 