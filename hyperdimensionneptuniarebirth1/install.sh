#!/bin/sh

cd "${DIR%/*}" || exit 1
echo $PWD
sh ./common.sh

rm -rf "$WINEPREFIX"
mkdir -pv ~/.winehelpers
cd ~/.winehelpers || exit 1
winetricks xact devenum quartz wmp9 vcrun2012 vcrun2013
