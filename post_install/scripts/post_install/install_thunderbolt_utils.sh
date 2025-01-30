#!/bin/bash

set -euo pipefail

echo "Installing thunderbolt utilities..."
pacman -S --noconfirm bolt tbtools

echo "Enrolling connected thunderbolt devices..."
boltctl_output=$(boltctl list)
devices=$(echo "$boltctl_output" | grep -E "name:|uuid:")

if [ -z "$devices" ]; then
    echo "No connected devices found."
elif
    while read -r name_line; do
        read -r uuid_line

        name=$(echo "$name_line" | awk -F": " '{print $2}')
        uuid=$(echo "$uuid_line" | awk -F": " '{print $2}')

        echo "Device found: $name (UUID: $uuid)"
        read -p "Do you want to enroll this device? (yes/no): " response

        if [[ "$response" =~ ^[Yy][Ee][Ss]$ ]]; then
            boltctl enroll "$uuid"
            if [ $? -eq 0 ]; then
                echo "Device $name (UUID: $uuid) enrolled successfully."
            else
                echo "Failed to enroll device $name (UUID: $uuid)."
            fi
        else
            echo "Skipping enrollment for device $name (UUID: $uuid)."
        fi
    done <<< "$(echo "$devices" | grep -E "name:|uuid:")"
fi
echo "" 