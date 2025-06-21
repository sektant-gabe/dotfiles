if [ "$OS_TYPE" = "ubuntu" ]; then
  # Ubuntu installation
  sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
  sudo apt update -y
  sudo apt install -y fastfetch
elif [ "$OS_TYPE" = "macos" ]; then
  # macOS installation
  brew install fastfetch
fi

# Only attempt to set configuration if fastfetch is not already set
if [ ! -f "$HOME/.config/fastfetch/config.jsonc" ]; then
  # Use Omachad fastfetch config
  mkdir -p ~/.config/fastfetch
  cp ~/.dotfiles/fastfetch/fastfetch.jsonc ~/.config/fastfetch/config.jsonc
fi
