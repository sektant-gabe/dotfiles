# Installs base terminal tools with OS-specific package managers
dotfiles_install() {
  if [ "$OS_TYPE" = "ubuntu" ]; then
    sudo apt-get install -y "$@"
  elif [ "$OS_TYPE" = "macos" ]; then
    brew install "$@"
  fi
}

if [ "$OS_TYPE" = "macos" ]; then
  # Install Homebrew if not present
  if ! command -v brew >/dev/null 2>&1; then
    echo -e "\033[1;35mInstalling Homebrew...\033[0m"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Add Homebrew to PATH for the current session
    eval "$(/opt/homebrew/bin/brew shellenv)" || eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

if [ "$OS_TYPE" = "ubuntu" ]; then
  sudo apt-get update -y
  sudo apt-get upgrade -y
fi

# Install common tools
dotfiles_install curl git unzip

# Run terminal installers
for installer in ~/.dotfiles/install/terminal/*.sh; do
  [ -f "$installer" ] && source "$installer"
done
