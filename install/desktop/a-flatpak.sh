# Install Flatpak (Ubuntu only)
if [ "$OS_TYPE" = "ubuntu" ]; then
  sudo apt install -y flatpak
  sudo apt install -y gnome-software-plugin-flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
elif [ "$OS_TYPE" = "macos" ]; then
  echo "Flatpak is not typically used on macOS. Skipping installation. Use Homebrew for package management."
fi
