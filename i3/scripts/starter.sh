#!/bin/bash

ps -C compton

if [ $? == 0 ];then
echo "Compton em execução" > $HOME/.config/i3/scripts/scripts.log
else
compton &
fi

ps -C volumeicon

if [ $? == 0 ];then
echo "Volumeicon em execução" >> $HOME/.config/i3/scripts/scripts.log
else
volumeicon &
fi
