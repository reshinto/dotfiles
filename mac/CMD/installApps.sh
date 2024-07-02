#!/bin/sh
# chmod a+x installApps.sh

function install() {
  # 1st arg, command value
  cmd=$1
  shift
  # 2nd arg, array
  arr=("$@")
  for i in "${arr[@]}";
  do
    $cmd "$i"
  done
}

echo export PATH=$PATH:/opt/homebrew/bin >> .zshrc
source ~/.zshrc

# brew packages
brewArr=(
  "macvim"
)

install "brew install" "${brewArr[@]}"

# brew cask
# https://caskroom.github.io/search
brewCaskArr=(
  "iterm2"
  "vlc"
  "google-chrome"
  "firefox"
  "whatsapp"
  "dropbox"
  "appcleaner"
  "grammarly"
  "rectangle"
  "licecap"
  "nordvpn"
  "zoom"
  "microsoft-teams"
  "macfuse"
  "telegram"
  "microsoft-edge"
  "voov-meeting"
  "wechat"
)

install "brew install --cask" "${brewCaskArr[@]}"
