#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

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

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

#xscreensaver -nosplash &
#conky -d
setxkbmap -option ctrl:nocaps
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &
xset s 1800 1800
xset dpms 3600 3600 3600
nvidia-settings --load-config-only
nvidia-settings -a [gpu:0]/GpuPowerMizerMode=1

while true; do
	make -C ~/builds/suckless/dwm
	~/builds/suckless/dwm/dwm
	sleep 1
done &

#feh --bg-scale ~/wallpapers/rain-drops-on-glass-7680x4320.jpg
feh --bg-scale ~/wallpapers/anon-киберпанк-Баян-длиннопост-1867135.png

while true; do
	source ~/scripts/desktop.statusbar.sh
done

#exec gnome-session
