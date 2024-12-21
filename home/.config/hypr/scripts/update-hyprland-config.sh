#!/bin/bash

# Define paths
HYPR_MODULES_DIR="$HOME/.config/hypr/modules"
HYPR_OUTPUT_CONFIG="$HOME/.config/hypr/hyprland.conf"

# Ensure the modules directory exists
if [[ ! -d "$HYPR_MODULES_DIR" ]]; then
    echo "Error: Modules directory $HYPR_MODULES_DIR does not exist."
    exit 1
fi

# Concatenate all .conf files in the modules directory into the main config
echo "# Hyprland Main Configuration File" > "$HYPR_OUTPUT_CONFIG"
for module in "$HYPR_MODULES_DIR"/*.conf; do
    if [[ -f "$module" ]]; then
        echo -e "\n# --- $(basename "$module") ---\n" >> "$HYPR_OUTPUT_CONFIG"
        cat "$module" >> "$HYPR_OUTPUT_CONFIG"
    else
        echo "Warning: No .conf files found in $HYPR_MODULES_DIR"
    fi
done

echo "Hyprland configuration updated successfully."
