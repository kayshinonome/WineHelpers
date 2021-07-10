#!/bin/bash

export WINEPREFIX=~/.winehelpers/hyperdimensionneptuniarebirth1
export WINEARCH=win32

cd "$(
    cd "$(dirname $0)"
    pwd -P
)" || exit 1

bash "./$1.sh" "$2"
