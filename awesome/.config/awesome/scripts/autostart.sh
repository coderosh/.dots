#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

# run feh --bg-fill /usr/share/backgrounds/Backgrounds/1584744923895.png
# run volctl
run picom
run nm-applet
run nitrogen --restore
run lxpolkit
run flameshot
run discord --start-minimized
