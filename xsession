#!/usr/bin/env bash

systemctl --user import-environment \
  PATH \
  XDG_SESSION_PATH \
  XDG_SEAT \
  XDG_SESSION_DESKTOP \
  XDG_SESSION_TYPE \
  XDG_SEAT_PATH \
  XDG_SESSION_CLASS \
  XDG_VTNR \
  XDG_SESSION_ID

if command -v dbus-update-activation-environment &> /dev/null; then
  dbus-update-activation-environment \
    PATH \
    XDG_SESSION_PATH \
    XDG_SEAT \
    XDG_SESSION_DESKTOP \
    XDG_SESSION_TYPE \
    XDG_SEAT_PATH \
    XDG_SESSION_CLASS \
    XDG_VTNR \
    XDG_SESSION_ID
fi

if ! systemctl --user is-active sxhkd.service &> /dev/null; then
  systemctl --user start sxhkd.service
fi
if ! systemctl --user is-active autostart.target &> /dev/null; then
  ( sleep 2 ; systemctl --user start autostart.target ) & disown
fi
