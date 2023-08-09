#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

# run feh --bg-fill /usr/share/backgrounds/Backgrounds/1584744923895.png
# run volctl
run picom
run lxpolkit
run nitrogen --restore

run nm-applet
run flameshot
run xfce4-clipman
# run discord --start-minimized

run discord

