#!/bin/bash

# Define the directory containing modular config files
HYPR_MODULES_DIR="$HOME/.config/hypr/modules"
HYPR_OUTPUT_CONFIG="$HOME/.config/hypr/hyprland.conf"

# Concatenate all files in the modules directory into the main config
cat "$HYPR_MODULES_DIR"/*.conf > "$HYPR_OUTPUT_CONFIG"

echo "Hyprland configuration updated successfully."