#!/bin/bash

DOCK_CMD="nwg-dock-hyprland"
DOCK_ARGS="-x -p bottom -l bottom -mb 0 -mt 0 -ml 0 -mr 0 -i 40"

if pgrep -f "$DOCK_CMD" > /dev/null; then
    pkill -f "$DOCK_CMD"
else
    for MON in $(hyprctl monitors | grep "Monitor" | awk '{print $2}'); do
        $DOCK_CMD -o "$MON" $DOCK_ARGS &
    done
fi
