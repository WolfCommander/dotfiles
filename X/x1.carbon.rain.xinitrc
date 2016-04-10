#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#bind keys using ~/xbindkeysrc
#xbindkeys
setxkbmap -option ctrl:nocaps

while true; do
	make -C ~/builds/dwm
	~/builds/dwm/dwm 2> ~/dwm.log
	sleep 1
done &

feh --bg-scale ~/wallpapers/rain-drops-on-glass-7680x4320.jpg

while true; do
	source ~/shellscripts/x1.carbon.statusbar.sh
done
