#!/bin/bash

chosen=$(echo -e "Waybar Styles" | rofi -dmenu -p "Utilities")

case "$chosen" in
    "Waybar Styles")
        /home/asked/.config/waybar/scripts/style-switcher.sh
        ;;
esac
