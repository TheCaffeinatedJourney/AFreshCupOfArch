#!/bin/bash

set -euo pipefail

project_root=$(realpath "$(dirname "$0")/../..")

echo "Updating skel"
echo "Adding /bin to user home"
mkdir -p /etc/skel/bin

echo "Updating .bashrc"
cp "$project_root/assets/.bashrc" /etc/skel/.bashrc
echo "" 