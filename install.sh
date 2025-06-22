# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo -e "\033[1;35mInstallation failed! You can retry by running: source ~/.dotfiles/install.sh\033[0m"' ERR

# Check the distribution name and version and abort if incompatible
source ~/.dotfiles/install/check-version.sh

# Ask for app choices
echo -e "\033[1;35mGet ready to make a few choices...\033[0m"
source ~/.dotfiles/install/terminal/required/app-gum.sh >/dev/null
source ~/.dotfiles/install/first-run-choices.sh
source ~/.dotfiles/install/identification.sh

# Desktop software and tweaks will only be installed if we're running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  # Ensure computer doesn't go to sleep or lock while installing
  gsettings set org.gnome.desktop.screensaver lock-enabled false
  gsettings set org.gnome.desktop.session idle-delay 0

  echo
  echo -e "\033[1;35mInstalling terminal and desktop tools...\033[0m"

  # Install terminal tools
  source ~/.dotfiles/install/terminal.sh

  # Install desktop tools and tweaks
  source ~/.dotfiles/install/desktop.sh

  # Revert to normal idle and lock settings
  gsettings set org.gnome.desktop.screensaver lock-enabled true
  gsettings set org.gnome.desktop.session idle-delay 300
else
  echo
  echo -e "\033[1;35mOnly installing terminal tools...\033[0m"
  source ~/.dotfiles/install/terminal.sh
fi

#!/bin/bash

function ask() {
  read -p "$1 (Y/n): " response
  [ -z "$response" ] || [ "$response" = "y" ]
}

for file in bash/*; do
  fullpath=$(realpath $file)
  if ask "Source ${file}?"; then
    echo "source $fullpath" >>~/.bashrc
  fi
done

if ask "Create & source ssh_aliases?"; then
  if [ ! -f ~/.ssh_aliases ]; then
    touch ~/.ssh_aliases
  fi
  echo "source ~/.ssh_aliases" >>~/.bashrc
fi

for file in ".vimrc" ".tmux.conf"; do
  if ask "Install ${file}?"; then
    ln -s "$(realpath "$file")" ~/${file}
  fi
done
