#!/bin/bash

function run {
  if ! pgrep -x $1 > /dev/null ; then
    $@ &
  fi
}

run sxhkd &
run blueberry-tray &
run nm-applet &
run dunst &
run picom -fb --experimental-backends --backend glx&
numlockx &
setxkbmap -option "ctrl:swapcaps" &
nitrogen --restore &
xss-lock --transfer-sleep-lock -- betterlockscreen -l &
$HOME/.config/polybar/launch.sh &
