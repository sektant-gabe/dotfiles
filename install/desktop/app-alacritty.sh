# Install Alacritty
if [ "$OS_TYPE" = "ubuntu" ]; then
  sudo apt install -y alacritty
elif [ "$OS_TYPE" = "macos" ]; then
  brew install alacritty
fi

# Configure Alacritty from dotfiles
mkdir -p ~/.config/alacritty
if [ -d ~/.dotfiles/alacritty ]; then
  cp ~/.dotfiles/alacritty/*.toml ~/.config/alacritty/
else
  echo -e "\033[1;35mAlacritty dotfiles not found in ~/.dotfiles/alacritty, skipping configuration...\033[0m"
fi

# Migrate config format if needed
alacritty migrate 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/pane.toml 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/btop.toml 2>/dev/null || true

# Set Alacritty as default (Ubuntu only)
if [ "$OS_TYPE" = "ubuntu" ]; then
  source ~/.dotfiles/install/desktop/set-alacritty-default.sh
fi
