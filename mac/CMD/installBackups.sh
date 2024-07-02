#!/bin/sh
# chmod a+x installBackups.sh

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

# install brew dependencies
xcode-select --install

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

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
  "google-hangouts"
  "firefox"
  "whatsapp"
  "dropbox"
  "appcleaner"
  "grammarly"
  "rectangle"
  "unpkg"
  "licecap"
  "nordvpn"
  "zoom"
  "microsoft-teams"
  "macfuse"
  "telegram"
  "microsoft-edge"
  "voov-meeting"
)

install "brew install --cask" "${brewCaskArr[@]}"

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
