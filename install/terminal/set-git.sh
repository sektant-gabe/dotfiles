# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# Set identification from install inputs
if [[ -n "${DOTFILES_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$DOTFILES_USER_NAME"
fi

if [[ -n "${DOTFILES_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$DOTFILES_USER_EMAIL"
fi

git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >>$HOME/.bashrc

