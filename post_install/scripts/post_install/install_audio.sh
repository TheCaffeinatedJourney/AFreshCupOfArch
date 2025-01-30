#!/bin/bash

set -euo pipefail

echo "Installing alsa, pipewire, pulseaudio, and related tools..."
pacman -S --noconfirm \
    alsa-firmware \
    alsa-plugins \
    alsa-utils \
    pipewire \
    pipewire-alsa \
    pipewire-audio \
    pipewire-docs \
    pipewire-jack \
    pipewire-pulse \
    pipewire-x11-bell \
    sof-firmware \
    sof-tools \
    wireplumber \
    wireplumber-docs \
    ffmpeg \
    ffmpegthumbs \
    helvum \
    realtime-privileges
echo ""