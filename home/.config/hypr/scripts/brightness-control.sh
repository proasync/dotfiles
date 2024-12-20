#!/bin/bash
# Brightness control script for Hyprland
# Requires brightnessctl to be installed

case "$1" in
    up)
        brightnessctl set +10%
        ;;
    down)
        brightnessctl set 10%-
        ;;
    *)
        echo "Usage: $0 {up|down}"
        exit 1
        ;;
esac
