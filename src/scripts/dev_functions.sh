#!/bin/bash

export INSTALL_ROOT=$HOME/install
cmake_opts=""
cmake_opts="$cmake_opts -DCMAKE_INSTALL_PREFIX=$INSTALL_ROOT -DCMAKE_PREFIX_PATH=$INSTALL_ROOT"
cmake_opts="$cmake_opts -DCMAKE_BUILD_TYPE=Debug"
cmake_opts="$cmake_opts -G Ninja"
alias dry-cmake="cmake $cmake_opts"

export MAKE_OPTIONS="-j 4"
alias dry-make="make $cmake_opts"
