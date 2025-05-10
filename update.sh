#!/bin/bash

OK="$(tput setaf 2)[OK]$(tput sgr0)"
ERROR="$(tput setaf 1)[ERROR]$(tput sgr0)"
NOTE="$(tput setaf 3)[NOTE]$(tput sgr0)"
INFO="$(tput setaf 4)[INFO]$(tput sgr0)"
WARN="$(tput setaf 1)[WARN]$(tput sgr0)"
CAT="$(tput setaf 6)[ACTION]$(tput sgr0)"
MAGENTA="$(tput setaf 5)"
ORANGE="$(tput setaf 214)"
WARNING="$(tput setaf 1)"
YELLOW="$(tput setaf 3)"
GREEN="$(tput setaf 2)"
BLUE="$(tput setaf 4)"
SKY_BLUE="$(tput setaf 6)"
RESET="$(tput sgr0)"

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ -z "$XDG_CONFIG_HOME" ]; then
    echo "no xdg config home"
    echo "using ~/.config"
    XDG_CONFIG_HOME=$HOME/.config
fi

if [ ! -d "$XDG_CONFIG_HOME" ]; then
    echo "Creating config directory at $XDG_CONFIG_HOME"
    mkdir -p "$XDG_CONFIG_HOME"
fi

log() {
  echo "$1"
}

update_files() {
    log "copying over files from: $1"
    pushd $1 &> /dev/null
    (
        configs=`find . -mindepth 1 -maxdepth 1 -type d`
        for c in $configs; do
            directory=${2%/}/${c#./}
            if [ -d "$directory" ]; then
              log "    removing: rm -rf $directory"
              rm -rf $directory
            fi

            log "    copying env: cp $c $2"
            cp -r ./$c $2
        done

    )
    popd &> /dev/null
}

copy() {
    if [ -e "$dest" ]; then
      log "removing: $2"
      rm $2
    fi

    log "copying: $1 to $2"
    cp $1 $2
}

update_files $script_dir/env/.config $XDG_CONFIG_HOME

copy $script_dir/env/.zshrc $HOME/.zshrc
copy $script_dir/env/.zsh_profile $HOME/.zsh_profile
