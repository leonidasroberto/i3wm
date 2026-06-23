#!/bin/bash
# © 2026 brightness.sh ~ AGL ~ github.com/aglairdev


output=$(xrandr | awk '/ connected/{print $1; exit}')
current=$(xrandr --verbose | grep -i brightness | head -1 | awk '{print $2}')

if [ "$1" == "up" ]; then
    new=$(echo "$current + 0.1" | bc)
    [ $(echo "$new > 1.0" | bc) -eq 1 ] && new=1.0
else
    new=$(echo "$current - 0.1" | bc)
    [ $(echo "$new < 0.1" | bc) -eq 1 ] && new=0.1
fi

xrandr --output $output --brightness $new
