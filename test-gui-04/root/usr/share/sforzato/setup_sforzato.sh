#!/bin/bash
#
# setup_sforzato.sh  2024/03/12
#
# 各ユーザー初期起動時の設定シェルスクリプト
#
# Written by aruelu, 2024/03/12
#

#実行フラグファイル
RUNFILE=~/.local/run_setup_sforzato

#実行チェック
if [ -f $RUNFILE ]
then
    exit 0
fi

#ユーザーがsfarzatoの場合（Live環境を想定）
if [ "$USER" == "sforzato" ]
then
    #キーボードレイアウトの設定
	dconf write /org/gnome/desktop/input-sources/xkb-options "['lv3:ralt_switch', 'grp:alt_shift_toggle', 'grp_led:scroll']"
	dconf write /org/gnome/desktop/input-sources/sources "[('ibus', 'mozc-jp-jp'),('xkb', 'jp')]"
fi

#アプリケーションメニューの有効化
#gsettings set org.gnome.shell enabled-extensions "['apps-menu@gnome-shell-extensions.gcampax.github.com']"

#ArcMenuの有効化
gsettings set org.gnome.shell enabled-extensions "['arcmenu@arcmenu.com']"


#ウィンドウの縮小・拡大ボタンの表示
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

#gnome shell 再起動
gnome-shell --replace

#実行フラグファイルの作成
touch $RUNFILE
