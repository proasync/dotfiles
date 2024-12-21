#!/bin/bash

# Explicitly set HOME
HOME="/home/proasync"

# Define paths using the explicitly set HOME
HYPR_MODULES_DIR="$HOME/.config/hypr/modules"
HYPR_OUTPUT_CONFIG="$HOME/.config/hypr/hyprland.conf"

# Concatenate all files in the modules directory into the main config
cat "$HYPR_MODULES_DIR"/*.conf > "$HYPR_OUTPUT_CONFIG"

echo "Hyprland configuration updated successfully."
