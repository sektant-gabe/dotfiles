# Install Neovim and dependencies
if [ "$OS_TYPE" = "ubuntu" ]; then
  cd /tmp
  wget -O nvim.tar.gz "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz"
  tar -xf nvim.tar.gz
  sudo install nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
  sudo cp -R nvim-linux-x86_64/lib /usr/local/
  sudo cp -R nvim-linux-x86_64/share /usr/local/
  rm -rf nvim-linux-x86_64 nvim.tar.gz
  cd -
  sudo apt install -y luarocks tree-sitter-cli
elif [ "$OS_TYPE" = "macos" ]; then
  brew install neovim luarocks tree-sitter
fi

# Configure Neovim from dotfiles if not already set
if [ ! -d "$HOME/.config/nvim" ]; then
  if [ -d ~/.dotfiles/nvim ]; then
    cp -r ~/.dotfiles/nvim ~/.config/
  else
    echo -e "\033[1;35mNeovim dotfiles not found in ~/.dotfiles/nvim, using LazyVim default...\033[0m"
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
  fi
fi

# Replace desktop launcher (Ubuntu only)
if [ "$OS_TYPE" = "ubuntu" ] && [ -d ~/.local/share/applications ]; then
  sudo rm -rf /usr/share/applications/nvim.desktop
  sudo rm -rf /usr/local/share/applications/nvim.desktop
  source ~/.dotfiles/applications/Neovim.sh
fi
