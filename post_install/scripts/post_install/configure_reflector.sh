#!/bin/bash

set -euo pipefail

project_root=$(realpath "$(dirname "$0")/../..")

echo "Configuring reflector"
echo "Updating reflector.conf"
cp "$project_root/assets/reflector.conf" /etc/xdg/reflector/reflector.conf

echo "Enabling reflector.service and reflector.timer"
systemctl enable --now reflector.service
systemctl enable reflector.timer
echo "" 