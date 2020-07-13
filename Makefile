SHELL := /usr/bin/env bash

etc := $(foreach e, $(shell find etc/ -type f), /$(e))

system_services := tlp apparmor docker NetworkManager lightdm lm_sensors \
                   systemd-netns@wireguard bluetooth

user_services := at-spi-dbus-bus autorandr-launcher dropbox dunst \
                 gnome-keyring gpaste keybase nm-applet picom polybar pulseaudio-x11 \
                 redshift rumno udiskie xfce-polkit xfce-power-manager xfsettingsd \
                 xss-lock

.DEFAULT_GOAL = rcup

install: rcup-with-hooks etc zoom system-services user-services

.PHONY: rcup
rcup:
	env RCRC=$(PWD)/rcrc rcup -K -v -d $(HOME)/.dotfiles

.PHONY: rcup-with-hooks
rcup-with-hooks:
	env RCRC=$(PWD)/rcrc rcup -v -d $(HOME)/.dotfiles

.PHONY: etc
etc: $(etc)
	@ sudo systemctl daemon-reload

/etc/%: etc/%
	@ echo sudo install --backup=simple --suffix .bak -D -p -m644 $< $@

.PHONY: system-services
system-services: $(system_services)

$(system_services):
	@ sudo systemctl is-enabled $@.service &> /dev/null || sudo systemctl enable $@.service --now

.PHONY: user-services
user-services: $(user_services)

$(user_services):
	@ systemctl --user is-enabled $@.service &> /dev/null || systemctl --user enable $@.service

zoom: /usr/local/bin/zoom

/usr/local/bin/zoom: /usr/bin/firejail
	sudo ln --symbolic /usr/bin/firejail /usr/local/bin/zoom

/usr/local/bin/dmenu:
	sudo ln --symbolic /usr/bin/rofi /usr/local/bin/dmenu

pictures = wallpapers lockscreens screenshots
pictures: $(foreach p, $(pictures), $(HOME)/pictures/$(p))

$(HOME)/pictures/%: $(HOME)/Dropbox/%
	@ test -L $@ || ln --verbose --symbolic --no-target-directory ../Dropbox/$* $@

# (fish) shell completions
completions:
	test -f $(XDG_CONFIG_HOME)/fish/completions/vault.fish || vault -autocomplete-install
	rustup completions fish > $(XDG_CONFIG_HOME)/fish/completions/rustup.fish

# rust-related targets
rust-update:
	@ rustup update

rust-stable:
	@ rustup toolchain install stable
