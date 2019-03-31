#!/bin/bash

export INSTALL_ROOT=$HOME/install
cmake_opts=""
cmake_opts="$cmake_opts -DCMAKE_INSTALL_PREFIX=$INSTALL_ROOT -DCMAKE_PREFIX_PATH=$INSTALL_ROOT"
cmake_opts="$cmake_opts -DCMAKE_BUILD_TYPE=Debug"
export MAKEW_CMAKE_OPTIONS="$cmake_opts"
export MAKEW_MAKE_OPTIONS="-j 4"

alias drys-cmake="cmake $MAKEW_CMAKE_OPTIONS"
alias drys-make="make $MAKEW_MAKE_OPTIONS"


makew_usage()
{
  printf "Usage: makew -hdcCmn <targets>\n"
  printf "MAKEW_CMAKE_OPTIONS: $MAKEW_CMAKE_OPTIONS\n"
  printf "MAKEW_MAKE_OPTIONS: $MAKEW_MAKE_OPTIONS\n"
  printf "[-h <help>]\n"
  printf "[-d <dry run>]\n"
  printf "[-c rm -rf cmake-build-debug]\n"
  printf "[-C cmake]\n"
  printf "[-m make]\n"
  printf "[-n ninja]\n"
}

makew()
{
    dryscripts_is_dryrun=0

    #read command line parameters
    local OPTIND o
    run_clean=0
    run_cmake=0
    run_make=0
    run_ninja=0
    while getopts ":hDcCmn" o; do
        case "${o}" in
            h)
                makew_usage
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
		        makew_usage
                return
                ;;
        esac
    done
    shift $(($OPTIND - 1))
    make_target=$@

    # construct cmake and make commands
    cmake_command="cmake $MAKEW_CMAKE_OPTIONS .."
    make_command="make $MAKEW_MAKE_OPTIONS"
    if [[ run_ninja -eq 1 ]];
    then
        cmake_command="$cmake_command -G Ninja"
        make_command="ninja"
        run_make=1
    fi
    make_command="$make_command $make_target"

    #execute
    build_dir="cmake-build-debug"
    if [[ run_clean -eq 1 ]];
    then
        _dryscripts_bashrun rm -rf $build_dir
    fi
    if [[ run_cmake -eq 1 ]];
    then
        _dryscripts_bashrun mkdir -p $build_dir
        _dryscripts_bashrun cd $build_dir
        _dryscripts_bashrun $cmake_command
        if [ ! $? -eq 0 ]; then return; fi
        _dryscripts_bashrun cd ..
    fi
    if [[ run_make -eq 1 ]];
    then
        _dryscripts_bashrun cd $build_dir
        _dryscripts_bashrun $make_command
        if [ ! $? -eq 0 ]; then return; fi
        _dryscripts_bashrun cd ..
    fi
}

export -f makew_usage
export -f makew
