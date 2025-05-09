#!/usr/bin/env bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export DEV_ENV="$(pwd)"

runs_dir=`find $script_dir/runs -mindepth 1 -maxdepth 1 -executable`

for s in $runs_dir; do
    if basename $s | grep -vq "$grep"; then
        log "grep \"$grep\" filtered out $s"
        continue
    fi

    log "running script: $s"

    $s
done

./update.sh
