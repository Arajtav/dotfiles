#!/bin/sh
# thanks arthomnix
if pidof waybar; then
  killall waybar
else
  waybar
fi
