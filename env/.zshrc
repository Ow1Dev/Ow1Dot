# Created by newuser for 5.9

HISTFILE=~/.history
HISTSIZE=100000
SAVEHIST=100000

setopt inc_append_history

autoload -U compinit && compinit

source $HOME/.zsh_profile
source $HOME/.cargo/env # rust

export PATH=$PATH:$HOME/.vorpal/bin # go
export PATH=$PATH:$HOME/.local/share/ow1/bin # go

alias ls='ls --color=auto -hv'

alias l='ls'
alias ll='ls -l'
alias la='ls -lA'

alias zlj="zellij"
alias zj="zellij -l welcome"

alias wt="git worktree"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
