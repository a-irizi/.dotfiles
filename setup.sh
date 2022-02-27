#!/bin/sh

cwd=$(pwd)

# yt-dlp
if [[ ! -d "$HOME/.config/yt-dlp" ]]
then
	mkdir -p "~/.config/yt-dlp"
fi
ln -s $cwd/.config/yt-dlp/config $HOME/.config/yt-dlp/config

# mpv
if [[ ! -d "$HOME/.config/mpv" ]]
then
	mkdir -p "~/.config/mpv"
fi
ln -s $cwd/.config/mpv/mpv.conf $HOME/.config/mpv/mpv.conf

# .personal_aliases
ln -s $cwd/.personal_aliases $HOME/.personal_aliases
