#!/bin/bash

finish-bash()
{
    source ~/.bash_profile
}

function showhelp() 
{
    cat $DRY_SCRIPTS/help/$1
}

function do-subdirs() {
    local OPTIND o
    local subdirs=()
    while getopts ":d:" o; do
        case "${o}" in
            d)
                subdirs+=("${OPTARG}")
                ;;
            *)
                echo "Unimplemented option chosen."
                return
                ;;
        esac
    done
    shift $(($OPTIND - 1))
    cmd="$@"

    if [ ${#subdirs[@]} -eq 0 ]; then
        subdirs=`ls -d */ | grep "^$cur" | paste -sd " " -`
    fi
    echo cmd:$cmd SUBDIRS: ${subdirs[@]}

    if [[ -z "$cmd" ]]; then
        echo "Nothing to run"
        return
    fi

    for subdir in $subdirs; do
        echo ================================ $subdir ================================
        cd $subdir && $cmd
        if [ ! $? -eq 0 ]; then
            cd ..
            return
        fi
        cd ..
    done
}

function _dry-complete-init()
{
    words=`ls $DRY_SCRIPTS/help | grep "^$cur" | paste -sd " " -`
    complete -W "$words" showhelp
}

_dry-complete-init
