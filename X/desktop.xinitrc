#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#xscreensaver -nosplash &
#conky -d
setxkbmap -option ctrl:nocaps
#exec awesome
#exec gnome-session

while true; do
	make -C ~/builds/dwm
	~/builds/dwm/dwm
	sleep 1
done &

#feh --bg-scale ~/wallpapers/rain-drops-on-glass-7680x4320.jpg
feh --bg-scale ~/wallpapers/anon-киберпанк-Баян-длиннопост-1867135.png

while true; do
	source ~/shellscripts/desktop.statusbar.sh
done
