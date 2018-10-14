#!/bin/bash

finish-bash()
{
    source ~/.bash_profile
}

showhelp()
{
    cat $DRY_SCRIPTS/help/$1
}

_dryscripts_run()
{
    echo $@
    bash -c "$@"
}

do-subdirs-usage()
{
  printf "Usage: do-subdirs -c <command> -f <ignore errors> <subdirs>\n"
  printf "[-h <help>]\n" 1>&2;
}

do-subdirs() {
    local OPTIND o
    local cmd=""
    local ignore_errors=0
    while getopts ":hc:f" o; do
        case "${o}" in
            h)
                do-subdirs-usage
                return
                ;;
            c)
                cmd="${OPTARG}"
                ;;
            f)
                ignore_errors=1
                ;;
            *)
                echo "Unimplemented option chosen."
                return
                ;;
        esac
    done
    shift $(($OPTIND - 1))
    subdirs=("$@")

    if [ ${#subdirs[@]} -eq 0 ]; then
        subdirs=(`ls -d */ | grep "^$cur" | paste -sd " " -`)
    fi
    echo cmd:$cmd
    echo ${#subdirs[@]} dirs: ${subdirs[@]}

    if [[ -z "$cmd" ]]; then
        echo "Nothing to run"
        return
    fi

    for subdir in "${subdirs[@]}"; do
        echo ================================ $subdir ================================
        cd $subdir || return
        _dryscripts_run "$cmd"
        if [ ! $? -eq 0 ]; then
            if [[ ignore_errors -eq 0 ]]; then
                cd ..
                return
            fi
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
