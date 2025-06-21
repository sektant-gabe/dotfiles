# Install btop
if [ "$OS_TYPE" = "ubuntu" ]; then
  sudo apt install -y btop
elif [ "$OS_TYPE" = "macos" ]; then
  brew install btop
fi

# Configure btop
mkdir -p ~/.config/btop/themes
cp ~/.dotfiles/btop/btop.conf ~/.config/btop/btop.conf
