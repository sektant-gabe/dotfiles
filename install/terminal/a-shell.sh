export SHELL_CONFIG=~/.bashrc
export SHELL_DEFAULTS=~/.dotfiles/bash/bashrc
# Configure bash shell
[ -f "$HOME/.bashrc" ] && mv ~/.bashrc ~/.bashrc.bak
cp "$SHELL_DEFAULTS" "$SHELL_CONFIG"
source ~/.dotfiles/bash/shell

# Configure inputrc
[ -f "$HOME/.inputrc" ] && mv ~/.inputrc ~/.inputrc.bak
cp ~/.dotfiles/bash/inputrc ~/.inputrc
