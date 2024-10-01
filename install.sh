#!/bin/bash

source ~/dotfiles/library.sh

install_yay

# _installPackagesPacman "rsync" "gum" "figlet" "python" "git";
_installPackagesPacman "rsync" "gum" "figlet" "python" "git" "stow";


# Install general packages
source ~/dotfiles/packages/general-packages.sh
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesYay "${packagesYay[@]}"

# Install hyprland-specific packages
# source ~/dotfiles/packages/hyprland-packages.sh
# _installPackagesPacman "${packagesPacman[@]}"
# _installPackagesYay "${packagesYay[@]}"

# Install awesome wm specific packages
source ~/dotfiles/packages/awesome-packages.sh
_installPackagesPacman "${packagesPacman[@]}"
_installPackagesYay "${packagesYay[@]}"

# Stow configurations
#stow -d ~/dotfiles/config -t ~ awesome
# stow -d ~/dotfiles/config -t ~ alacritty
#stow -d ~/dotfiles/home -t ~ .bashrc
# stow -d ~/dotfiles/bin -t ~/bin

echo "All packages have been installed."
