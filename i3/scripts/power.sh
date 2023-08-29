#!/bin/bash
echo "POWER"

powermenu(){
v=$(zenity --list --title="POWER" --text="POWER MANEGER" --radiolist --column="" --column="OPÇÕES" "" "DESLIGAR SISTEMA" "" "REINICIAR SISTEMA")
if [ "$v" == "DESLIGAR SISTEMA" ];then
shutdown now
elif [ "$v" == "REINICIAR SISTEMA" ];then
reboot
else
zenity --info --title=INFO --text="NENHUMA AÇÃO SELECIONADA" --ellipsize
fi
}


case $BLOCK_BUTTON in
 1)powermenu;;
esac
