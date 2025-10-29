#!/usr/bin/env bash
#
# MysticDotfiles Installer
# ------------------------
# A setup script to install and configure your dotfiles environment.
#

# ==============================
#       ASCII ART HEADER
# ==============================

cat << "EOF"
 __  __           _        _      ____        _    __ _ _      
|  \/  | ___  ___| |_ __ _| |__  |  _ \  ___ | |_ / _(_) | ___ 
| |\/| |/ _ \/ __| __/ _` | '_ \ | | | |/ _ \| __| |_| | |/ _ \
| |  | |  __/\__ \ || (_| | |_) || |_| | (_) | |_|  _| | |  __/
|_|  |_|\___||___/\__\__,_|_.__/ |____/ \___/ \__|_| |_|_|\___|
                                                               
                 MysticDotfiles Installer
EOF

echo ""
echo "=============================================="
echo "   Welcome to the MysticDotfiles installer!"
echo "=============================================="
echo ""

# ==============================
#     PRE-INSTALL CHECKS
# ==============================

echo "[*] Checking for required dependencies..."
sudo pacman -S git curl wget make cmake

echo "[+] All checks passed!"
echo ""

# ==============================
#     INSTALLATION STEPS
# ==============================

echo "[*] Starting installation..."

echo "-> Installing yay..."
cd /tmp
  git clone https://aur.archlinux.org/yay-bin.git
  cd yay-bin
  makepkg -si --noconfirm
  cd -
  rm -rf yay-bin
  cd ~

echo "-> Installing dependencies..."
yay -S --noconfirm --needed \
  git wget curl unzip inetutils impala \
  fd eza fzf ripgrep zoxide bat jq \
  wl-clipboard fastfetch btop \
  man tldr less whois plocate bash-completion \
  alacritty plymouth imagemagick

echo "-> Installing minegrub theme..."
yay -S grub-theme-minegrub-world-selection-git

echo "-> Installing minesddm theme..."
git clone https://github.com/Davi-S/sddm-theme-minesddm.git ~/sddm-theme-minesddm && sudo cp -r ~/sddm-theme-minesddm/minesddm /usr/share/sddm/themes/

echo -> Installing plymouth theme..."
git clone https://github.com/nikp123/minecraft-plymouth-theme
    cd minecraft-plymouth-theme
    sudo ./install.sh
    plymouth-set-default-theme -R mc

echo ""
echo "=============================================="
echo "   MysticDotfiles installation complete!"
echo "   Restart arch linux to change"
echo "=============================================="
echo ""
