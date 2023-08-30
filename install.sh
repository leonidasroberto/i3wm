#!/bin/bash

echo "Instalando dependencias!"

case $1 in 
"arch")
sudo pacman -Syy
sudo pacman -S --noconfirm sysstat xfce4-terminal i3blocks \
    lxappearance nitrogen lxqt-policykit xfce4-power-manager \
    lightdm lightdm-webkit2-greeter imagemagick ttf-font-awesome \
    awesome-terminal-fonts xdotool volumeicon notify-osd pavucontrol which \
    ranger w3m fish compton rofi
    mkdir ~/.config/ranger
    echo "set preview_images true" > ~/.config/ranger/rc.conf
if [[ $? != 0 ]];then
    echo "ERRO DURANTE INSTALAÇÃO DE Dependencias"
    exit
fi
;;

"ubuntu")
sudo apt update
sudo apt install -y i3 i3blocks arandr \
    lxappearance nitrogen pavucontrol network-manager \
    network-manager-gnome policykit-1-gnome compton \
    compton-conf volumeicon-alsa rofi xfce4-power-manager \
    lightdm lightdm-webkit2-greeter imagemagick gnome-terminal sysstat \
    fonts-font-awesome xdotool notify-osd ranger fish
    #i3lock xautolock
if [[ $? != 0 ]];then
    echo "ERRO DURANTE INSTALAÇÃO DE Dependencias"
    exit
fi

cp -v ./compton.conf $HOME/.config/
yes | sudo add-apt-repository ppa:regolith-linux/release
sudo apt install i3-gaps -y
;;
*) 
echo "Opção inválida!"
exit;;
esac
cp -v ./picom.conf $HOME/.config/

fc-cache -fv

cp -v ./.i3blocks.conf $HOME/
cp -rv ./i3 $HOME/.config/
sudo cp -rv ./rofi-themes/* /usr/share/rofi/themes/

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

## ICONES para i3blocks -> https://fontawesome.com/v5/cheatsheet
## Alternativas para notificação pesquisar -> notification-daemon
