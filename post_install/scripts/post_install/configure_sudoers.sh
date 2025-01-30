#!/bin/bash

set -euo pipefail

echo "Configuring sudoers"
sudoers_file="/etc/sudoers"

sed -i 's/^[#]\(%wheel ALL=(ALL:ALL) ALL\)/\1/' "$sudoers_file"

if ! grep -q '^Defaults insults$' "$sudoers_file"; then
    {
        echo ""
        echo "#  If set, sudo will insult users when they enter an incorrect password."
        echo "Defaults insults"
    } >> "$sudoers_file"
fi
echo "" 