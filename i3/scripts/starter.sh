#!/bin/bash

ps -C picom

if [ $? == 0 ];then
echo "Picom em execução" > $HOME/.config/i3/scripts/scripts.log
else
picom &
fi

ps -C volumeicon

if [ $? == 0 ];then
echo "Volumeicon em execução" >> $HOME/.config/i3/scripts/scripts.log
else
volumeicon &
fi
