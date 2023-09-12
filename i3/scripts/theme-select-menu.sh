#!/bin/bash
selected=$(echo "tema1
tema2
tema3
tema4
cancelar" | rofi -dmenu -p "MENU DE TEMAS")
[[ -z $selected ]] && exit
case $selected in
"tema1")python  $HOME/.config/i3/scripts/theme-selector.py theme1;;
"tema2")python  $HOME/.config/i3/scripts/theme-selector.py theme2;;
"tema3")python  $HOME/.config/i3/scripts/theme-selector.py theme3;;
"tema4")python  $HOME/.config/i3/scripts/theme-selector.py theme4;;
*)exit;;
esac