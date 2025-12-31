export LANG=en_CA.UTF-8
#export ENV=$HOME/.kshrc

xrdb -merge $HOME/.Xresources

xsetroot -solid dimgrey

xidle &

#xset b off

xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation" 1
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Button" 2
xinput set-prop "/dev/wsmouse" "WS Pointer Wheel Emulation Axes" 6 7 4 5

xterm -name bar -class bar -e "$HOME/bin/status.sh" &

exec cwm
