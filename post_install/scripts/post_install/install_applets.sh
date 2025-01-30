#!/bin/bash

set -euo pipefail

echo "Installing applets..."
pacman -S --noconfirm network-manager-applet
echo "" 