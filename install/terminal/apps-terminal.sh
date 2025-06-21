# Install terminal tools
if [ "$OS_TYPE" = "ubuntu" ]; then
  sudo apt install -y fzf ripgrep bat eza zoxide plocate apache2-utils fd-find tldr
elif [ "$OS_TYPE" = "macos" ]; then
  brew install fzf ripgrep bat eza zoxide fd tldr
fi

