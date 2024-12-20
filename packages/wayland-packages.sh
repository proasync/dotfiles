# Packages from the official Pacman repository
packagesPacman=(
    "wayland"                # Wayland protocol libraries
    "wlroots"                # Modular Wayland compositor library
    "xwayland"               # X server for running X11 apps on Wayland
    "wayland-utils"          # Utilities for Wayland
    "swaybg"                 # Background utility for Wayland compositors
    "swayidle"               # Idle management daemon for Wayland
    "swaylock"               # Screen locker for Wayland compositors
    "gtk3"                   # GTK3 support for Wayland
    "qt5-wayland"            # Qt5 Wayland plugin
    "qt6-wayland"            # Qt6 Wayland plugin
    "grim"                   # Screenshot utility for Wayland
    "slurp"                  # Select regions for screenshots
    "foot"                   # Minimal Wayland terminal emulator
    "wofi"                   # Wayland native application launcher
    "light"                  # Lightweight brightness control utility
    "mako"                   # Notification daemon for Wayland
    "xdg-desktop-portal-wlr" # Portal backend for Wayland (screen sharing, etc.)
    "bemenu"                 # Dynamic menu for Wayland (like dmenu)
)

# Packages from the AUR (requires Yay or similar AUR helper)
packagesYay=(
    "waybar"                  # Highly customizable status bar for Wayland
    "tofi"                    # Modern Wayland launcher (alternative to rofi)
    "clipman"                 # Clipboard manager for Wayland
    "wofi-git"                # Wayland native launcher (Git version for latest features)
)
