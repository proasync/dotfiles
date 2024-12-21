# ------------------------------------------------------
# Install yay if not present
# ------------------------------------------------------
install_yay() {
    if ! command -v yay &>/dev/null; then
        echo ":: yay not found, installing yay..."
        sudo pacman -S --noconfirm --needed base-devel git
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay
        makepkg -si --noconfirm
        cd ~
        rm -rf /tmp/yay
        echo ":: yay installed successfully."
    else
        echo ":: yay is already installed."
    fi
}

# ------------------------------------------------------
# Create or update symlinks
# ------------------------------------------------------
_installSymLink() {
    name="$1"
    symlink="$2"
    linksource="$3"
    linktarget="$4"

    if [ -L "${symlink}" ]; then
        rm "${symlink}"
    elif [ -d "${symlink}" ]; then
        rm -rf "${symlink}/"
    elif [ -f "${symlink}" ]; then
        rm "${symlink}"
    fi
    ln -s "${linksource}" "${linktarget}"
    echo ":: Symlink ${linksource} -> ${linktarget} created."
}

# ------------------------------------------------------
# Check if a package is installed with Pacman
# ------------------------------------------------------
_isInstalledPacmanFix() {
    pacman -Qi "$1" &>/dev/null
    return $?  # 0 if installed, 1 if not
}

# ------------------------------------------------------
# Install packages with Pacman
# ------------------------------------------------------
_installPackagesPacman() {
    for pkg in "$@"; do
        if ! _isInstalledPacmanFix "$pkg"; then
            if ! sudo pacman --noconfirm -S "$pkg"; then
                echo "❌ Failed to install ${pkg}! Logging error."
                echo "$pkg" >> install_errors.log
            fi
        fi
    done
}

# ------------------------------------------------------
# Check if a package is installed with Yay
# ------------------------------------------------------
_isInstalledYayFix() {
    yay -Qi "$1" &>/dev/null
    return $?  # 0 if installed, 1 if not
}

# ------------------------------------------------------
# Install packages with Yay
# ------------------------------------------------------
_installPackagesYay() {
    toInstall=()
    for pkg in "$@"; do
        if ! _isInstalledYayFix "$pkg"; then
            toInstall+=("$pkg")
        fi
    done

    if [ "${#toInstall[@]}" -gt 0 ]; then
        if ! yay --noconfirm -S "${toInstall[@]}"; then
            for pkg in "${toInstall[@]}"; do
                echo "❌ Failed to install ${pkg}! Logging error."
                echo "$pkg" >> install_errors.log
            done
        fi
    fi
}

# ------------------------------------------------------
# Install LuaRocks Package (lgi with Lua 5.3)
# ------------------------------------------------------
install_lgi() {
    echo "Installing lgi with LuaRocks and Lua 5.3..."
    
    # Ensure Lua 5.3 and luarocks are installed
    if ! pacman -Qs lua53 &>/dev/null || ! pacman -Qs luarocks &>/dev/null; then
        echo "Installing Lua 5.3 and LuaRocks..."
        sudo pacman -S --needed lua53 luarocks || { echo "❌ Failed to install Lua 5.3 or LuaRocks!"; return 1; }
    fi

    # Install lgi via LuaRocks for Lua 5.3
    if ! luarocks --lua-version=5.3 show lgi &>/dev/null; then
        echo "❌ lgi not found for Lua 5.3. Installing..."
        if ! sudo luarocks --lua-version=5.3 install lgi; then
            echo "❌ Failed to install lgi with LuaRocks. Logging error."
            echo "lgi (Lua 5.3)" >> install_errors.log
            return 1
        else
            echo "✅ Successfully installed lgi for Lua 5.3."
            return 0
        fi
    else
        echo "✅ lgi is already installed for Lua 5.3."
        return 0
    fi
}

