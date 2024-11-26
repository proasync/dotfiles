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

# Install Hyprland-specific packages
# echo "Installing Hyprland-specific packages..."
# source ~/dotfiles/packages/hyprland-packages.sh
# _installPackagesPacman "${packagesPacman[@]}"
# _installPackagesYay "${packagesYay[@]}"
# allPackagesPacman+=("${packagesPacman[@]}")
# allPackagesYay+=("${packagesYay[@]}")

# Install Awesome WM-specific packages
echo "Installing Awesome WM-specific packages..."
source ~/dotfiles/packages/awesomewm-packages.sh
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesYay "${packagesYay[@]}"
allPackagesPacman+=("${packagesPacman[@]}")
allPackagesYay+=("${packagesYay[@]}")

# Install lgi
install_lgi

# Stow configurations (kept commented for now)
# echo "Stowing configurations..."
# stow -d ~/dotfiles/config -t ~ awesome
# stow -d ~/dotfiles/config -t ~ alacritty
# stow -d ~/dotfiles/home -t ~ .bashrc
# stow -d ~/dotfiles/bin -t ~/bin

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

echo "Installation process complete. Check install_errors.log for failures."
