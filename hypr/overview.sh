#!/bin/bash

workspaces_json=$(hyprctl workspaces -j)
windows_json=$(hyprctl clients -j)

output=""

# Az összes workspace-t egy tömbbe olvassuk be
workspaces_count=$(echo "$workspaces_json" | jq length)

for (( i=0; i<workspaces_count; i++ )); do
  ws_id=$(echo "$workspaces_json" | jq ".[$i].id")
  ws_name="Workspace $ws_id"

  apps=$(echo "$windows_json" | jq -r --argjson id "$ws_id" '
    .[] | select(.workspace == $id) | "  • " + .title
  ')

  if [[ -z "$apps" ]]; then
    apps="  (üres)"
  fi

  output+="$ws_name - Ablakok:\n$apps\n\n"
done

echo -e "$output" | wofi --dmenu --prompt "Hyprland Workspace Overview"
