#!/bin/bash

# Directory containing the wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
  echo "Wallpaper directory not found: $WALLPAPER_DIR" >&2
  exit 1
fi

# Rofi command
rofi_command="rofi -dmenu -i -p 'Select Wallpaper' -theme /home/asked/.config/rofi/themes/wallpaper-selector.rasi"

# Get the list of wallpapers
wallpapers=()
for wallpaper in "$WALLPAPER_DIR"/*; do
  if [ -f "$wallpaper" ]; then
    wallpapers+=("$(basename "$wallpaper")")
  fi
done

# Generate Rofi input
rofi_input=""
for wallpaper in "${wallpapers[@]}"; do
  rofi_input+="$wallpaper\0icon\x1f$WALLPAPER_DIR/$wallpaper\n"
done

# Show Rofi and get the selected wallpaper
selected_wallpaper=$(echo -en "$rofi_input" | $rofi_command)

# If a wallpaper is selected, set it with swww
if [ -n "$selected_wallpaper" ]; then
  swww img "$WALLPAPER_DIR/$selected_wallpaper" --transition-type any
fi
