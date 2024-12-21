#!/bin/bash

# Ensure the script is run with sudo privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root. Use sudo."
    exit 1
fi

# Paths
DOTFILES_KEYD_CONF="~/dotfiles/config/keyd/default.conf"
SYSTEM_KEYD_CONF_DIR="/etc/keyd"
SYSTEM_KEYD_CONF="$SYSTEM_KEYD_CONF_DIR/default.conf"

# Ensure the dotfiles keyd configuration exists
if [[ ! -f $DOTFILES_KEYD_CONF ]]; then
    echo "Configuration file $DOTFILES_KEYD_CONF does not exist. Please create it first."
    exit 1
fi

# Ensure keyd is installed
if ! command -v keyd &>/dev/null; then
    echo "Keyd is not installed. Please install it first."
    exit 1
fi

# Create the keyd configuration directory if it doesn't exist
if [[ ! -d "$SYSTEM_KEYD_CONF_DIR" ]]; then
    echo "Creating keyd configuration directory..."
    mkdir -p "$SYSTEM_KEYD_CONF_DIR"
fi

# Backup existing configuration if it exists
if [[ -f "$SYSTEM_KEYD_CONF" ]]; then
    echo "Backing up existing keyd configuration..."
    cp "$SYSTEM_KEYD_CONF" "${SYSTEM_KEYD_CONF}.bak"
fi

# Symlink the configuration from dotfiles
echo "Linking $DOTFILES_KEYD_CONF to $SYSTEM_KEYD_CONF..."
ln -sf "$DOTFILES_KEYD_CONF" "$SYSTEM_KEYD_CONF"

# Restart the keyd service to apply changes
echo "Restarting keyd service..."
systemctl restart keyd

echo "Keyd configuration applied successfully! Caps remapping is now active."
