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
    $cmd install "$i"
  done
}

# install brew dependencies
xcode-select --install

# install brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew packages
brewArr=(
  "zsh"
  "wget"
  "macvim"
  "node"
  "yarn"
  "http-server"
  "opencv"
  "mysql"
  "postgresql"
  "cmus"
  "eslint"
  "tiny-html5"
  "neofetch"
  "mps-youtube"
  "heroku/brew/heroku"
  "chrome-cli"
  "darksky-weather"
  "docker"
  "docker-clean"
  "docker-completion"
  "ffmpeg"
  "googler"
  "ranger"
  "htop"
  "speedtest-cli"
  "td"
  "tmux"
  "watchman"
  "wifi-password"
  "autopep8"
)

install brew "${brewArr[@]}"

# brew cask
# https://caskroom.github.io/search
brewCaskArr=(
  "iterm2"
  "anaconda"
  "vlc"
  "google-chrome"
  "google-hangouts"
  "whatsapp"
  "dropbox"
  "mactex"
  "virtualbox"
  "virtualbox-extension-pack"
  "mysqlworkbench"
  "android-file-transfer"
  "android-studio"
  "appcleaner"
  "avira-antivirus"
  "cheatsheet"
  "falcon-sql-client"
  "docker"
  "github"
  "grammarly"
  "java"
  "mongodb-compass-community"
  "nvidia-geforce-now"
  "osxfuse"
  "pgadmin4"
  "postman"
  "spectacle"
  "spotify"
  "sublime-text"
  "tor-browser"
  "unity"
  "epic-games"
  "vagrant"
  "vagrant-manager"
  "windscribe"
  "yt-music"
  "slack"
  "dash"
  "force-paste"
  "diffmerge"
)

install "brew cask" "${brewCaskArr[@]}"

# python3 packages
pyArr=(
  "tqdm"
  "jedi"
  "pillow"
  "pipenv"
)

install pip3 "${pyArr[@]}"

# npm packages
jsArr=(
  "csslint"
  "expo-cli"
  "firebase-tools"
  "fixjson"
  "nodemon"
  "prettier"
  "tern"
  "ttab"
)

install "npm -g" "${jsArr[@]}"

# install amix vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
