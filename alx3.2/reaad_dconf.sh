#!/bin/bash

# dconfで設定されている内容を全て表示するスクリプト

# dconfのキーのルートを指定します。
ROOT_KEY="/org/gnome/"

# dconfの設定を出力する関数
function print_dconf_settings() {
  local key="$1"
  local indent="$2"
  local children

  echo "${indent}[$key]"

  # キーの値を取得
  local value=$(dconf read "$key" 2>/dev/null)

  if [ -n "$value" ]; then
    echo "${indent}  $value"
  fi

  # 子キーの取得
  children=$(dconf list "$key" 2>/dev/null)

  # 子キーがある場合、再帰的に各子キーの設定を表示
  for child in $children; do
    print_dconf_settings "$key$child" "${indent}  "
  done
}

#ルートキーから再帰的に設定を表示
print_dconf_settings "$ROOT_KEY" ""

