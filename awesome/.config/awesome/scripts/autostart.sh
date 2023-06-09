#!/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

# run feh --bg-fill /usr/share/backgrounds/Backgrounds/1584744923895.png
# run nitrogen --restore
run picom
run nm-applet
# run volctl
run lxpolkit
