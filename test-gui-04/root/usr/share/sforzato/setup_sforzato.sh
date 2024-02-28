#!/bin/bash

RUNFILE=~/.local/run_setup_sforzato

if [ -f $RUNFILE ]
then
    exit 0
fi

if [ "$USER" == "sforzato" ]
then
	dconf write /org/gnome/desktop/input-sources/xkb-options "['lv3:ralt_switch', 'grp:alt_shift_toggle', 'grp_led:scroll']"
	dconf write /org/gnome/desktop/input-sources/sources "[('ibus', 'mozc-jp-jp'),('xkb', 'jp')]"
fi

#gsettings set org.gnome.shell enabled-extensions "['apps-menu@gnome-shell-extensions.gcampax.github.com']"
#gnome-shell --replace

touch $RUNFILE
