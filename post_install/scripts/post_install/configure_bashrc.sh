#!/bin/bash

set -euo pipefail

project_root=$(realpath "$(dirname "$0")/../..")

echo "Updating /etc/bash.bashrc"
cp "$project_root/assets/bash.bashrc" /etc/bash.bashrc
echo "" 