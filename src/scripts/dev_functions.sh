#!/bin/bash

export INSTALL_ROOT=$HOME/install

cmake_opts=""
cmake_opts="$cmake_opts -DCMAKE_INSTALL_PREFIX=$INSTALL_ROOT -DCMAKE_PREFIX_PATH=$INSTALL_ROOT"
cmake_opts="$cmake_opts -DBUILD_SHARED_LIBS=ON"
cmake_opts="$cmake_opts -DBUILD_APPLICATIONS=ON"
cmake_opts="$cmake_opts -DBUILD_PYTHON=ON"
cmake_opts="$cmake_opts -DENABLE_PYTHON=ON"
cmake_opts="$cmake_opts -DBUILD_TESTING=OFF -DBUILD_TESTS=OFF"
cmake_opts="$cmake_opts -DBUILD_ECL_SUMMARY=ON"
cmake_opts="$cmake_opts -G Ninja"

alias dry-cmake="cmake $cmake_opts"

#export CMAKE_OPTIONS="-DCMAKE_INSTALL_PREFIX=$DRY_WORKDIR/foo -DCMAKE_PREFIX_PATH=$DRY_WORKDIR/foo -DCMAKE_BUILD_TYPE=Debug"
#export MAKE_OPTIONS="-j 4"
