#!/bin/bash

set -euo pipefail

echo "Configuring pacman"
conf="/etc/pacman.conf"

echo "Setting Color option"
if grep -Eq '^[#]*Color' "$conf"; then
    sed -i 's/^[#]*Color/Color/' "$conf"
else
    sed -i '/^\[options\]/a Color' "$conf"
fi

echo "Setting CheckSpace option"
if grep -Eq '^[#]*CheckSpace' "$conf"; then
    sed -i 's/^[#]*CheckSpace/CheckSpace/' "$conf"
else
    sed -i '/^\[options\]/a CheckSpace' "$conf"
fi

echo "Setting VerbosePkgLists option"
if grep -Eq '^[#]*VerbosePkgLists' "$conf"; then
    sed -i 's/^[#]*VerbosePkgLists/VerbosePkgLists/' "$conf"
else
    sed -i '/^\[options\]/a VerbosePkgLists' "$conf"
fi

echo "Setting ParallelDownloads option"
if grep -Eq '^[#]*ParallelDownloads' "$conf"; then
    sed -i 's/^[#]*ParallelDownloads.*/ParallelDownloads = 10/' "$conf"
else
    sed -i '/^\[options\]/a ParallelDownloads = 10' "$conf"
fi

echo "Setting ILoveCandy option"
if grep -Eq '^[#]*ILoveCandy' "$conf"; then
    sed -i 's/^[#]*ILoveCandy/ILoveCandy/' "$conf"
else
    sed -i '/^\[options\]/a ILoveCandy' "$conf"
fi
echo "" 