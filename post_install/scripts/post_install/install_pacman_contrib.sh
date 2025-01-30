#!/bin/bash

set -euo pipefail

echo "Installing and configuring pacman-contrib..."
pacman -S --noconfirm pacman-contrib

systemctl enable paccache.timer 