# Packages from the official Pacman repository
packagesPacman=(
    "archlinux-keyring"  # Ensures Arch's package signing keys are up to date
    "yarn"               # Package manager for Node.js
    "nvm"                # Node Version Manager for managing Node.js versions
    "brightnessctl"      # Controls screen brightness
    "gimp"               # GNU Image Manipulation Program for photo editing
    "git"                # Version control system
    "postgresql"         # Relational database system
    "alacritty"          # Lightweight GPU-accelerated terminal emulator
    "chromium"           # Open-source web browser (basis for Google Chrome)
    "snapd"              # Snap package manager for installing Snap packages
    "stow"               # Symlink farm manager for managing dotfiles
    "dbeaver"            # Universal database client
    "imagemagick"        # Command-line image manipulation tool
    "neovim"             # Modernized Vim text editor
    "pipewire"           # Modern audio and video server (replaces PulseAudio)
    "pipewire-pulse"     # PulseAudio compatibility layer for PipeWire
    "pipewire-alsa"      # ALSA compatibility layer for PipeWire
    "pipewire-jack"      # JACK compatibility layer for PipeWire
    "wireplumber"        # Session manager for PipeWire
    "gdm"                # Simple Desktop Display Manager (login screen)
    "gnome-tweaks"       # Advanced GTK/GNOME configuration tool
    "gnome-themes-extra" # Extra themes for GNOME
    "gnome-keyring"      # GNOME password and secret management
    "libsecret"          # Library for accessing passwords and secrets
    "ttf-dejavu"         # Popular sans-serif font
    "ttf-font-awesome"   # Font Awesome icons
    "noto-fonts"         # Multi-language font support
    "htop"               # Terminal-based process viewer
    "btop"               # Advanced system resource monitor
    "rsync"              # File synchronization and backup tool
    "gtk-engine-murrine" # GTK theme engine for compatibility with older themes
)

# Packages from the AUR (requires Yay or similar AUR helper)
packagesYay=(
    "nvm"                         # Node Version Manager (AUR version)
    "teams-for-linux"             # Microsoft Teams client for Linux
    "visual-studio-code-bin"      # Binary release of Microsoft's VS Code editor
    "google-chrome"               # Google Chrome browser
    "openssl"                     # SSL/TLS cryptography library
    "hollywood"                   # Terminal Hollywood hacking effect
    "heroku-cli"                  # Command-line interface for Heroku
    "spotify"                     # Spotify client
    "ngrok"                       # Creates secure tunnels to localhost
    "nerd-fonts-mononoki"         # Mononoki Nerd Font for programming and terminal use
)
