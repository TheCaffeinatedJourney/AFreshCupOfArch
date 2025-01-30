#!/bin/bash

set -euo pipefail

echo "Installing lightdm..."
pacman -S --noconfirm lightdm lightdm-slick-greeter
echo "" 