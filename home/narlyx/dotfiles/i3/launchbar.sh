#!/usr/bin/env bash
polybar-msg cmd quit
#killall -q polybar

polybar --config=~/.config/i3/polybar.ini
