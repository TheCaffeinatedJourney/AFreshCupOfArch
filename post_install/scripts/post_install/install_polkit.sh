#!/bin/bash

set -euo pipefail

echo "Installing polkit..."
pacman -S --noconfirm polkit polkit-gnome
echo "" 