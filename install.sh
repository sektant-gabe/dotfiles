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
