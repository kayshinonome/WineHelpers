#!/bin/bash

rm -rf "$WINEPREFIX"
mkdir -pv ~/.winehelpers
cd ~/.winehelpers || exit 1
winetricks xact devenum quartz wmp9 vcrun2012 vcrun2013 windowscodecs
