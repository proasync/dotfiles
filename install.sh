#!/bin/bash

source ~/dotfiles/library.sh

_installPackagesPacman "rsync" "gum" "figlet" "python" "git";

# Install general packages
source ~/dotfiles/packages/general-packages.sh
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesYay "${packagesYay[@]}"

# Install hyprland-specific packages
source ~/dotfiles/packages/hyprland-packages.sh
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesYay "${packagesYay[@]}"

echo "All packages have been installed."
