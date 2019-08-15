#!/bin/sh

[ -r .config ] || { echo "No .config file; did you copy headless-armv7.barebox.config from <factory>/src/local/config?" >&2; exit 1; } 

[ -e .config.save ] || ln -f .config .config.save

export PATH="/opt/timesys/armv7hf/toolchain/bin:$PATH"
export CROSS_COMPILE=armv7l-zii-linux-gnueabihf-
export HOSTSTRIP=/usr/bin/strip
export ARCH=arm
 
make -j4 oldconfig || { echo ".config could not be parsed. Did you copy the right file to .config?"; exit 2; }
make -j4
