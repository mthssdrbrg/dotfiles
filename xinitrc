#!/usr/bin/env bash

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
   if [[ -x $f ]]; then
     echo "loading $f" && . "$f"
   fi
 done
 unset f
fi

if [[ -f /etc/profile ]]; then
  echo "loading /etc/profile" && . /etc/profile
fi

if [[ -f $HOME/.Xresources ]]; then
  echo "loading $HOME/.Xresources" && xrdb -merge ~/.Xresources
fi

exec bspwm
