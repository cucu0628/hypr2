#!/bin/bash

# Megnézi, fut-e wofi
if pgrep -x "rofi" > /dev/null
then
  # Ha igen, kilövi
  pkill -x rofi
else
  # Ha nem, elindítja
  rofi -show drun -theme ~/.config/rofi/themes/cyberpunk.rasi &
fi
