#!/bin/bash

export INSTALL_ROOT=$HOME/install
cmake_opts=""
cmake_opts="$cmake_opts -DCMAKE_INSTALL_PREFIX=$INSTALL_ROOT -DCMAKE_PREFIX_PATH=$INSTALL_ROOT"
cmake_opts="$cmake_opts -DCMAKE_BUILD_TYPE=Debug"
cmake_opts="$cmake_opts -G Ninja"
export DRYS_CMAKE_OPTIONS="$cmake_opts"
export DRYS_MAKE_OPTIONS="-j 4"

alias drys-cmake="cmake $DRYS_CMAKE_OPTIONS"
alias drys-make="make $DRYS_MAKE_OPTIONS"


drys_make_usage()
{
  printf "Usage: drys_make -hdcCmn <targets>\n"
  printf "DRYS_CMAKE_OPTIONS: $DRYS_CMAKE_OPTIONS\n"
  printf "DRYS_MAKE_OPTIONS: $DRYS_MAKE_OPTIONS\n"
  printf "[-h <help>]\n"
  printf "[-d <dry run>]\n"
  printf "[-c rm -rf cmake-build-debug]\n"
  printf "[-C cmake]\n"
  printf "[-m make]\n"
  printf "[-n ninja]\n"
}

drys_make()
{
    dryscripts_is_dryrun=0

    local OPTIND o
    run_clean=0
    run_cmake=0
    run_make=0
    run_ninja=0
    while getopts ":hDcCmn" o; do
        case "${o}" in
            h)
		        drys_make_usage
                return
		        ;;
            D)
		        dryscripts_is_dryrun=1
		        ;;
            c)
                run_clean=1
                ;;
            C)
                run_cmake=1
                ;;
            m)
                run_make=1
                ;;
            n)
                run_ninja=1
                ;;
            *)
                echo "Unimplemented option chosen."
		        drys_make_usage
                return
                ;;
        esac
    done
    shift $(($OPTIND - 1))
    make_target=$@

    cmake_command="cmake $DRYS_CMAKE_OPTIONS .."
    make_command="make $DRYS_MAKE_OPTIONS"
    if [[ run_ninja -eq 1 ]];
    then
        cmake_command="$cmake_command -G Ninja"
        make_command="ninja"
        run_make=1
    fi
    make_command="$make_command $make_target"
    if [[ run_clean -eq 1 ]];
    then
        _dryscripts_bashrun rm -rf cmake-build-debug
    fi
    if [[ run_cmake -eq 1 ]];
    then
        mkdir -p cmake-build-debug && cd cmake-build-debug
        _dryscripts_bashrun $cmake_command
        if [ ! $? -eq 0 ]; then return; fi
        cd ..
    fi
    if [[ run_make -eq 1 ]];
    then
        cd cmake-build-debug
        _dryscripts_bashrun $make_command
        if [ ! $? -eq 0 ]; then return; fi
        cd ..
    fi
}

export -f drys_make_usage
export -f drys_make