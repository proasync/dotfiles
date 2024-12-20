# ------------------------------------------------------
# Install dotfiles
# ------------------------------------------------------

# if [ -d ~/dotfiles/alacritty ]; then
#     _installSymLink alacritty ~/.config/alacritty ~/dotfiles/alacritty/ ~/.config
# fi

# if [ -d ~/dotfiles/vim ]; then
#     _installSymLink vim ~/.config/vim ~/dotfiles/vim/ ~/.config
# fi
# if [ $neovim == "1" ] ;then
#     if [ -d ~/dotfiles/nvim ]; then
#         _installSymLink nvim ~/.config/nvim ~/dotfiles/nvim/ ~/.config
#     fi
# fi

source library.sh

if [ -d ~/dotfiles/starship ]; then
    _installSymLink starship ~/.config/starship.toml ~/dotfiles/starship/starship.toml ~/.config/starship.toml
fi
if [ -d ~/dotfiles/rofi ]; then
    _installSymLink rofi ~/.config/rofi ~/dotfiles/rofi/ ~/.config
fi
if [ -d ~/dotfiles/dunst ]; then
    _installSymLink dunst ~/.config/dunst ~/dotfiles/dunst/ ~/.config
fi
if [ -d ~/dotfiles/hypr ]; then
    _installSymLink hypr ~/.config/hypr ~/dotfiles/hypr/ ~/.config
fi
if [ -d ~/dotfiles/waybar ]; then
    _installSymLink waybar ~/.config/waybar ~/dotfiles/waybar/ ~/.config
fi
if [ -d ~/dotfiles/swaylock ]; then
    _installSymLink swaylock ~/.config/swaylock ~/dotfiles/swaylock/ ~/.config
fi
if [ -d ~/dotfiles/wlogout ]; then
    _installSymLink wlogout ~/.config/wlogout ~/dotfiles/wlogout/ ~/.config
fi
if [ -d ~/dotfiles/swappy ]; then
    _installSymLink swappy ~/.config/swappy ~/dotfiles/swappy/ ~/.config
fi
# if [ -d ~/dotfiles/eww ]; then
#     _installSymLink eww ~/.config/eww ~/dotfiles/eww/ ~/.config
# fi
if [ -d ~/dotfiles/fastfetch ]; then
    _installSymLink fastfetch ~/.config/fastfetch ~/dotfiles/fastfetch/ ~/.config
fi
if [ -d ~/dotfiles/waypaper ]; then
    _installSymLink waypaper ~/.config/waypaper ~/dotfiles/waypaper/ ~/.config
fi
echo ":: Symbolic links created."
echo
