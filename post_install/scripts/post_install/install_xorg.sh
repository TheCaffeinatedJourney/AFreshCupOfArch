#!/bin/bash

set -euo pipefail

echo "Installing xorg, display drivers, and related tools..."
pacman -S --noconfirm arandr xorg-server xorg-xinit mesa vulkan-intel vulkan-mesa-layers intel-media-driver brightnessctl
echo "" 