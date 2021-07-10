#!/bin/bash

# Without this, a crash occurs when you reach the level in game
WINEDLLOVERRIDES="xactengine3_7=n,b"

echo "$1"

if [ -z "$1" ]; then
    echo "Give the path to the main executable as the argument"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File given not found"
    exit 1
fi

cd "$(dirname -- "$1")" || exit 1
wine "$1"
