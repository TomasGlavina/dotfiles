# My Dotfiles

This repo is for me for whenever i wanna distro jump, i have hyprland and sway
setups, so if anyone finds this repo you can use both setups as well.

This is very minimal and in no sense a rice, just a functional setup for me.

## Install (Fedora / Wayland)

### 1) Prereqs
Install GNU Stow (and git if you somehow lost it):
```bash
sudo dnf install -y stow git
```

### 2) Clone Repo
```bash
git clone <your-repo-url> ~/projects/dotfiles
cd ~/projects/dotfiles
```

### 3) Stow Configs
```bash
stow -vt ~ bash ghostty hypr kitty nvim sway swaylock tmux waybar
# Add more as needed
```

### 4) Additional Setup

- Waybar scripts:
```bash
chmod +x ~/.config/waybar/scripts/*.sh
```
