#!/bin/bash

# Define paths
DOTFILES_DIR="$HOME/dotfiles"
WALLPAPERS_DIR="$DOTFILES_DIR/wallpapers"
TARGET_DIR="$HOME/.local/share/wallpapers"

# Ensure the wallpapers directory exists in dotfiles
if [ ! -d "$WALLPAPERS_DIR" ]; then
    echo "Creating wallpapers directory in dotfiles..."
    mkdir -p "$WALLPAPERS_DIR"
fi

# Ensure the target parent directory exists
if [ ! -d "$(dirname "$TARGET_DIR")" ]; then
    echo "Creating target parent directory..."
    mkdir -p "$(dirname "$TARGET_DIR")"
fi

# Create or update the symlink
if [ -L "$TARGET_DIR" ]; then
    echo "Updating existing symlink for wallpapers..."
    ln -sf "$WALLPAPERS_DIR" "$TARGET_DIR"
else
    echo "Creating new symlink for wallpapers..."
    ln -s "$WALLPAPERS_DIR" "$TARGET_DIR"
fi

echo "Symlink created: $TARGET_DIR -> $WALLPAPERS_DIR"
