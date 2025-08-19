#!/bin/bash

# Power menu with icons
chosen=$(echo -e " Shutdown\n Reboot\n Suspend\n Logout" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/themes/cyberpunk.rasi -show-icons)

case $chosen in
    " Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Suspend")
        systemctl suspend
        ;;
    " Logout")
        pkill -KILL -u $USER
        ;;
    *)
        exit 1
        ;;
esac
