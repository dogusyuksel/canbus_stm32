#!/bin/bash

if [ -d "thirdparty/libcanard" ]; then
    cd thirdparty/libcanard
    git checkout 43de1c4966b8d1e5d57978949d63e697f045b358
    git submodule update --init --recursive
    cd -
    patch -d . -p1 < ./patches/transport.py.patch
    patch -d . -p1 < ./patches/canard_stm32.patch
    ./thirdparty/libcanard/dsdl_compiler/libcanard_dsdlc ./nodes --incdir ./thirdparty/libcanard/dsdl_compiler/pyuavcan/uavcan --outdir ./canbus/generated_files
fi


exit 0
