#!/bin/bash

GAME=""

clear

display_result() {
    dialog --title "$1" \
        --no-collapse \
        --msgbox "$2" 0 0
}

display_main_menu() {

    SELECTION=$(
        dialog \
            --backtitle "Game Selection" \
            --title "Game Selection" \
            --clear \
            --menu "Please select:" 0 0 0 \
            "0" "Hyperdimension Neptunia Re;Birth1" \
            3>&1 1>&2 2>&3 3>&-
    )

    ISCANCEL=$?

    echo "$SELECTION"

    if [ $ISCANCEL == 1 ]; then
        clear
        exit 1
    fi

    case $SELECTION in
    0)
        GAME="hyperdimensionneptuniarebirth1"
        ;;

    esac

}

launch_or_install() {

    SELECTION=$(
        dialog \
            --backtitle "Game Selection" \
            --title "Game Selection" \
            --clear \
            --menu "Please select:" 0 0 0 \
            "0" "Prepare Wine Prefix" \
            "1" "Launch Game" \
            "2" "Set Game Path (Needed to launch game)" \
            3>&1 1>&2 2>&3 3>&-
    )

    ISCANCEL=$?

    echo "$SELECTION"

    if [ $ISCANCEL == 1 ]; then
        clear
        exit 1
    fi

    case $SELECTION in
    0)
        bash games/$GAME/common.sh install
        ;;
    1)
        if [ ! -f "games/$GAME/gamepath" ]; then
            echo "Gamepath not found, please enter it"
            set_gamepath $GAME
        fi
        bash ./games/$GAME/common.sh launch "$(cat "games/$GAME/gamepath")"
        ;;
    2)
        set_gamepath $GAME
        ;;
    esac
}

set_gamepath() {
    USER_INPUT=$(
        dialog \
            --inputbox "Enter the directory name:" 0 0 0 \
            3>&1 1>&2 2>&3 3>&-
    )
    echo "$USER_INPUT" | tr -d '\n' >games/$GAME/gamepath
}

display_result "WineHelpers" "These scripts are considered as-is, and may not work on all systems"
display_main_menu
launch_or_install
