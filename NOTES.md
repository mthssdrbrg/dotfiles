# Notes

## Firejail + AppArmor

* install `firejail` + `apparmor`
```
$ sudo pacman -S firejail
```
* append `apparmor=1 lsm=lockdown,yama,apparmor` to
`/boot/loader/entries/manjarolinux5.6.conf`
* enable `apparmor.service`
```
$ sudo systemctl enable apparmor.service
```
* symlink relevant apps:
```
# ln -s /usr/bin/firejail /usr/local/bin/zoom
```

## asdf

### Ruby

### NodeJS

## CoC.vim

### Ruby

gem install neovim

### NodeJS

npm install -g neovim

### Python

yay -S neovim-remote

### terraform-ls

yay -S terraform-ls-bin

### golang

https://github.com/neoclide/coc.nvim/wiki/Language-servers#go
:CocInstall coc-go

### YAML (Kubernetes)

### Bash

npm install -g bash-language-server

### Dockerfile

npm install -g dockerfile-language-server-nodejs

### Ruby

:CoCInstall coc-solargraph
gem install solargraph

### Dhall

yay -S dhall-lsp-server-bin
https://github.com/neoclide/coc.nvim/wiki/Language-servers#dhall

## Spotify + Spicetify

```
$ yay -S spotify spicetify spicetify-themes-git
$ sudo chmod a+wr /opt/spotify
$ sudo chmod a+wr /opt/spotify/Apps -R
$ spicetify backup apply
$ spicetify config current_theme Nord
$ spicetify apply
```

## "Desktop environment"

### xfce4-settings

Disable all keyboard shortcuts:

```
#!/usr/bin/env bash

function properties() {
  xfconf-query --channel xfce4-keyboard-shortcuts --list
}

for prop in $(properties); do
  xfconf-query --channel xfce4-keyboard-shortcuts --property "$prop" --set ""
  echo "$prop: disabled"
done
```

### xss-lock + xset s

### dunst

### rumno

### ttf-material-design-icons-webfont

### polybar

## Wireless: NetworkManager + iwd

```
$ sudo pacman -S iwd

$ cat /etc/systemd/system/iwd.service.d/override.conf
[Unit]
After=systemd-udevd.service
Before=NetworkManager.service

$ cat /etc/NetworkManager/conf.d/iwd.conf
[device]
wifi.backend=iwd
```

## XDG user dirs
* Edit `/etc/xdg/user-dirs.defaults`
* Create the directories in ~/
* `systemctl --user status xdg-user-dirs-update.service`

## XDG environment variables

```
$ cat /etc/X11/xinit/xinitrc.d/51-systemd-user-xdg.sh
#!/bin/sh

systemctl --user import-environment \
  XDG_SESSION_PATH \
  XDG_SEAT \
  XDG_SESSION_DESKTOP \
  XDG_SESSION_TYPE \
  XDG_SEAT_PATH \
  XDG_SESSION_CLASS \
  XDG_VTNR \
  XDG_SESSION_ID

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
  dbus-update-activation-environment \
    XDG_SESSION_PATH \
    XDG_SEAT \
    XDG_SESSION_DESKTOP \
    XDG_SESSION_TYPE \
    XDG_SEAT_PATH \
    XDG_SESSION_CLASS \
    XDG_VTNR \
    XDG_SESSION_ID
fi
```

## XF

## External screen brightness

```
$ sudo pacman -S linux56-headers
$ yay -S ddcci-driver-linux-dkms ddcutil
```

* Maybe relevant: https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/-/issues/6

## podman + buildah

```
# this doesn't work on ~Arch~Manjaro
$ sudo usermod --add-subuids 10000-75535 dist
$ sudo usermod --add-subgids 10000-75535 dist
# this probably does though
$ echo dist:10000:65536 | sudo tee -a /etc/subuid
$ echo dist:10000:65536 | sudo tee -a /etc/subgid
```

```
$ rm -rf ~/.config/containers ~/.local/share/containers
$ podman system migrate
$ podman unshare cat /proc/self/uid\_map
   0       1000          1
   1      10000      65536
```

## Fan control

* https://forum.manjaro.org/t/finally-got-my-fans-working-manually-on-dell-xps-13-9370/90548/3
* https://github.com/TomFreudenberg/dell-bios-fan-control
* https://github.com/vitorafsr/i8kutils/issues/6
* https://forum.manjaro.org/t/finally-got-my-fans-working-manually-on-dell-xps-13-9370/90548
* https://medium.com/@mijorus/thermal-tweaks-on-dell-laptops-running-linux-769c8c80022e 

## Misc

* https://superluserdo.xyz/blog/posts/2020/03/28/fake-home-prison/
* https://github.com/Amnesthesia/bspwm-config/blob/master/home/amnesthesia/.config/compton.conf
* https://novelist.xyz/tech/improve-font-rendering-arch-linux-no-infinality/
* https://blog.yucas.mx/2018/03/25/beautiful-fonts-improve-arch-linux/
* https://www.reddit.com/r/kde/comments/9qa82x/an_small_tip_install_and_run_xsettings_from/
* https://domas.monkus.lt/posts/2015-04-15-screen-locking-with-awesome-wm-and-lightdm/
