#!/bin/sh

cwd=$(pwd)

# yt-dlp
if [[ ! -d "$HOME/.config/yt-dlp" ]]
then
	mkdir -p "~/.config/yt-dlp"
fi
ln -s $cwd/.config/yt-dlp/config $HOME/.config/yt-dlp/config

# .personal_aliases
ln -s $cwd/.personal_aliases $HOME/.personal_aliases
