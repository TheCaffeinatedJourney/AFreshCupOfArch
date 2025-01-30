#!/bin/bash

set -euo pipefail

echo "Configuring makepkg"
sed -i "s/^[#]*MAKEFLAGS\s*=.*/MAKEFLAGS=\"-j$(nproc)\"/" /etc/makepkg.conf
echo "" 