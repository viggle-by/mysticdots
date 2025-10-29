#!/bin/bash
yay -S --noconfirm --needed \
  git wget curl unzip inetutils impala \
  fd eza fzf ripgrep zoxide bat jq \
  wl-clipboard fastfetch btop \
  man tldr less whois plocate bash-completion \
  alacritty plymouth imagemagick grub-theme-minegrub-world-selection-git && git clone https://github.com/Davi-S/sddm-theme-minesddm.git ~/sddm-theme-minesddm && sudo cp -r ~/sddm-theme-minesddm/minesddm /usr/share/sddm/themes/ && git clone https://github.com/nikp123/minecraft-plymouth-theme cd minecraft-plymouth-theme && sudo ./install.sh && plymouth-set-default-theme -R mc
     
