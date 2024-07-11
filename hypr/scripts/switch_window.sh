#!/bin/sh

DIRECTION=$1

if [ "$DIRECTION" = "next" ]; then
    hyprctl dispatch cyclenext
elif [ "$DIRECTION" = "prev" ]; then
    hyprctl dispatch cycleprev
fi