#!/bin/bash

# cd
alias cdw="cd $DRY_WORKDIR"
alias cdd="cd $DRY_WORKDIR/dry"
alias cde="cd $DRY_WORKDIR/external"
# dry modules
alias cdds="cd $DRY_SCRIPTS"

# git
alias git-origin="git config --get remote.origin.url"
alias git-status="git status --column"
alias git-status-untracked-no="git status --untracked=no"
alias git-status-all="find . -maxdepth 1 -mindepth 1 -type d -exec sh -c '(echo {} && cd {} && git status -s && echo)' \;"
