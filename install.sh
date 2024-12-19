#!/bin/bash

source ~/dotfiles/library.sh

# Track all packages for final verification
allPackagesPacman=()
allPackagesYay=()

# Install general packages
echo "Installing general packages..."
source ~/dotfiles/packages/general-packages.sh
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesYay "${packagesYay[@]}"
allPackagesPacman+=("${packagesPacman[@]}")
allPackagesYay+=("${packagesYay[@]}")

# Ask to install Wayland-specific packages
read -p "Do you want to install Wayland-specific packages? [y/N]: " installWayland
if [[ "$installWayland" =~ ^[Yy]$ ]]; then
    echo "Installing Wayland-specific packages..."
    source ~/dotfiles/packages/wayland-packages.sh
    _installPackagesPacman "${packagesPacman[@]}"
    _installPackagesYay "${packagesYay[@]}"
    allPackagesPacman+=("${packagesPacman[@]}")
    allPackagesYay+=("${packagesYay[@]}")
fi

# Ask to install Hyprland-specific packages
read -p "Do you want to install Hyprland-specific packages? [y/N]: " installHyprland
if [[ "$installHyprland" =~ ^[Yy]$ ]]; then
    echo "Installing Hyprland-specific packages..."
    source ~/dotfiles/packages/hyprland-packages.sh
    _installPackagesPacman "${packagesPacman[@]}"
    _installPackagesYay "${packagesYay[@]}"
    allPackagesPacman+=("${packagesPacman[@]}")
    allPackagesYay+=("${packagesYay[@]}")
fi

# Ask to install Xorg-specific packages
read -p "Do you want to install Xorg-specific packages? [y/N]: " installXorg
if [[ "$installXorg" =~ ^[Yy]$ ]]; then
    echo "Installing Xorg-specific packages..."
    source ~/dotfiles/packages/xorg-packages.sh
    _installPackagesPacman "${packagesPacman[@]}"
    _installPackagesYay "${packagesYay[@]}"
    allPackagesPacman+=("${packagesPacman[@]}")
    allPackagesYay+=("${packagesYay[@]}")
fi

# Ask to install AwesomeWM-specific packages
read -p "Do you want to install AwesomeWM-specific packages? [y/N]: " installAwesome
if [[ "$installAwesome" =~ ^[Yy]$ ]]; then
    echo "Installing Awesome WM-specific packages..."
    source ~/dotfiles/packages/awesomewm-packages.sh
    _installPackagesPacman "${packagesPacman[@]}"
    _installPackagesYay "${packagesYay[@]}"
    allPackagesPacman+=("${packagesPacman[@]}")
    allPackagesYay+=("${packagesYay[@]}")
    install_lgi
fi

# Final verification of all packages
echo "Final verification of all packages..."
echo "Verifying Pacman packages..."
for pkg in "${allPackagesPacman[@]}"; do
    if _isInstalledPacmanFix "$pkg"; then
        echo "✅ $pkg is installed."
    else
        echo "❌ $pkg is missing!"
    fi
done

echo "Verifying AUR packages..."
for pkg in "${allPackagesYay[@]}"; do
    if _isInstalledYayFix "$pkg"; then
        echo "✅ $pkg is installed."
    else
        echo "❌ $pkg is missing!"
    fi
done

# Ask to stow the ./home directory
read -p "Do you want to stow the ./home directory to your home folder? [y/N]: " stowHome
if [[ "$stowHome" =~ ^[Yy]$ ]]; then
    echo "Stowing the ./home directory..."
    cd ~/dotfiles || exit
    stow home
    echo "Stow operation completed."
fi

echo "Installation process complete. Check install_errors.log for failures."
