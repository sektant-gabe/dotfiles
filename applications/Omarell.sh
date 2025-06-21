cat <<EOF >~/.local/share/applications/Dotfiles-Config.desktop
[Desktop Entry]
Version=1.0
Name=Dotfiles Config
Comment=Dotfiles Controls
Exec=alacritty --config-file /home/$USER/.config/alacritty/pane.toml --class=Dotfiles --title=Dotfiles -e dotfiles
Terminal=false
Type=Application
Icon=/home/$USER/.dotfiles/applications/icons/dotfiles.png
Categories=GTK;
StartupNotify=false
EOF
