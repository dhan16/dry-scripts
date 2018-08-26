#!/bin/bash

function _dry-bash-init {
  if [[ -z "$DRY_WORKDIR" ]]; then
      DRY_WORKDIR=~/work
  fi

  local mydir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  export DRY_SCRIPTS=$mydir/../..

  source $mydir/functions.sh
  source $mydir/dev_functions.sh
  source $mydir/aliases.sh

  export PS1='[\u@\t \d \W]'
}

_dry-bash-init
