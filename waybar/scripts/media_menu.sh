#!/bin/bash

choice=$(printf "⏮ Előző\n⏯ Lejátszás / Szünet\n⏭ Következő" | wofi --dmenu --width=200 --height=140 --prompt="Zene vezérlés" --style="window { border-radius: 10px; }")

case "$choice" in
    *Előző*) playerctl previous ;;
    *Lejátszás*) playerctl play-pause ;;
    *Következő*) playerctl next ;;
esac
