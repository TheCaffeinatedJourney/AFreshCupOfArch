#!/bin/bash

set -euo pipefail

echo "Setting ntp..."
timedatectl set-ntp true
echo "" 