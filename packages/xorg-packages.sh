# Packages from the official Pacman repository
packagesPacman=(
    "xorg-server"           # Xorg display server
    "xorg-xinit"            # Tool to initialize an Xorg session
    "xorg-xkill"            # Kill GUI applications by clicking
    "arandr"                # Graphical tool for managing screen layouts
    "nitrogen"              # Wallpaper setting tool for Xorg
    "flameshot"             # Screenshot tool with annotation features
    "volumeicon"            # Lightweight volume control icon for the system tray
    "network-manager-applet"  # Network Manager applet for system tray
    "dex"                   # Desktop entry execution utility (runs .desktop files at startup)
    "rofi"                  # Application launcher and dmenu replacement
    "xsettingsd"            # X settings daemon for non-GNOME setups
    "picom"                     # Optional, for window compositing effects (transparency, shadows)
)

# Packages from the AUR (requires Yay or similar AUR helper)
packagesYay=(
    # No Xorg-specific AUR packages yet
)
