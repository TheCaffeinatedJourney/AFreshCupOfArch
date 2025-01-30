#!/bin/bash

set -euo pipefail

echo "Installing firefox..."
pacman -S --noconfirm firefox
echo "" 