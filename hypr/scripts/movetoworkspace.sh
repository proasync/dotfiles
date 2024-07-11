#!/bin/sh

# Get the workspace number from the argument
TARGET_WORKSPACE=$1

# Get the active monitor
ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .id')

if [ -z "$ACTIVE_MONITOR" ]; then
    echo "No active monitor found."
    exit 1
fi

# Construct the workspace identifier
WORKSPACE="${TARGET_WORKSPACE}"

# Move the active window to the target workspace on the active monitor
hyprctl dispatch movetoworkspace "${WORKSPACE}"