#!/bin/sh
# Simple script that uses maim to take a screenshot
output=$SCREENSHOT/"screenshot-$(date +%Y%m%d-%H%M%S).png"

menu() {
    echo "" | dmenu -p "How Long?" | xargs -I _ sleep "_"
}

case "$1" in
    "full") maim "$output" || exit;;
    "select") maim -s "$output" || exit ;;
    "fulltime") menu && maim "$output" || exit ;;
    "selecttime") menu && maim -s "$output" || exit ;;

esac

notify-send "Maim" "Screenshot Taken"
