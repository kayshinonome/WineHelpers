#!/bin/sh

WINEDLLOVERRIDES="xactengine3_7=n,b"

cd "${DIR%/*}" || exit 1
sh ./common.sh

if [ -z "$1" ]; then
    echo "Give the path to the main executable as the argument"
fi

if [ ! -f "$1" ]; then
    echo "File given not found"
fi

wine "$1"
