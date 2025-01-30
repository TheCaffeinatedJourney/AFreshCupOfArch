#!/bin/bash

set -euo pipefail

echo "Installing timeshift..."
pacman -S --noconfirm timeshift

systemctl enable cronie.service
echo "" 