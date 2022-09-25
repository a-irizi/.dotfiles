#!/bin/bash

pgrep -x sxhkd > /dev/null || sxhkd &
dunst &
picom -fb --experimental-backends --backend glx&
numlockx &
setxkbmap -option "ctrl:swapcaps" &
nitrogen --restore &
xss-lock --transfer-sleep-lock -- betterlockscreen -l &
$HOME/.config/polybar/launch.sh &
