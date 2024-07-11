#!/bin/sh

# Get the workspace number from the argument
TARGET_WORKSPACE=$1

# Get the active monitor name
ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused) | .name')

# Switch to the target workspace on the active monitor
hyprctl dispatch workspace "$ACTIVE_MONITOR,$TARGET_WORKSPACE"