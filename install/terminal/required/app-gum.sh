# Installs gum with OS-specific logic
if [ "$OS_TYPE" = "macos" ]; then
  echo -e "\033[1;35mInstalling gum via Homebrew...\033[0m"
  brew install gum
elif [ "$OS_TYPE" = "ubuntu" ]; then
  cd /tmp
  GUM_VERSION="0.14.3"
  wget -qO gum.deb "https://github.com/charmbracelet/gum/releases/download/v${GUM_VERSION}/gum_${GUM_VERSION}_amd64.deb"
  sudo apt-get install -y --allow-downgrades ./gum.deb
  rm gum.deb
  cd -
fi
