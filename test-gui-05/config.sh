#!/bin/bash
#================
# FILE          : config.sh
#----------------
# PROJECT       : OpenSuSE KIWI Image System
# COPYRIGHT     : (c) 2006 SUSE LINUX Products GmbH. All rights reserved
#               :
# AUTHOR        : Marcus Schaefer <ms@suse.de>
#               :
# BELONGS TO    : Operating System images
#               :
# DESCRIPTION   : configuration script for SUSE based
#               : operating systems
#----------------
#======================================
# Functions...
#--------------------------------------
test -f /.kconfig && . /.kconfig
test -f /.profile && . /.profile

#======================================
# Greeting...
#--------------------------------------
echo "Configure image: [$kiwi_iname]..."

#======================================
# Setup baseproduct link
#--------------------------------------
suseSetupProduct

#======================================
# Activate services
#--------------------------------------
suseInsertService sshd
suseInsertService NetworkManager

#======================================
# Setup default target, multi-user
#--------------------------------------
baseSetRunlevel 5

#======================================
# ArcMenu(GNOME拡張機能)のインストール
#--------------------------------------
cd /usr/share/gnome-shell/extensions/
gnome-extensions install arc-menu@arc-menu.com
gnome-extensions enable arc-menu@arc-menu.com

#======================================
# Firefox(Flatpakから)のインストール
#--------------------------------------
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install -y flathub org.mozilla.firefox
