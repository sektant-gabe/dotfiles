
launchctl setenv NEOVIDE_FRAME "buttonless"
launchctl setenv NEOVIDE_TITLE_HIDDEN "true"
launchctl setenv NEOVIDE_VSYNC "1"
launchctl setenv NEOVIDE_FORK "0"

alias uvsrc="source .venv/bin/activate"
alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'

export NVIM_APPNAME="nvim"
export EDITOR="hx"

eval "$(starship init zsh)"
alias vim="bob run nightly"
alias nvim-kickstart='NVIM_APPNAME="nvim-kickstart" nvim'
alias nvim-cpp='NVIM_APPNAME="nvim-cpp" nvim'
alias nvim="bob run nightly"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias config='/usr/bin/git --git-dir=/Users/sektant/.cfg/ --work-tree=/Users/sektant'
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi
alias config='/usr/bin/git --git-dir=/Users/sektant/.cfg/ --work-tree=/Users/sektant'
