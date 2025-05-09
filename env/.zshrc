# Created by newuser for 5.9

source $HOME/.zsh_profile
source $HOME/.cargo/env # rust

export PATH=$PATH:/usr/local/go/bin # go

alias zlj="zellij"
alias zj="zellij -l welcome"
alias docker="podman"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
