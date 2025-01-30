#!/bin/bash

set -euo pipefail

echo "Enabling NetworkManager.service"
systemctl enable --now NetworkManager.service
echo ""