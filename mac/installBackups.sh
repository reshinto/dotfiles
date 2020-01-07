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
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew packages
brewArr=(
  "python"
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
  "httpie"
  "mongodb"
  "rlwrap"
  "fzf"
  "neomutt"
  "nasm"
  "mono"
)

install "brew install" "${brewArr[@]}"

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
  "db-browser-for-sqlite"
  "ngrok"
)

install "brew cask install" "${brewCaskArr[@]}"

# python3 packages
pyArr=(
  "tqdm"
  "jedi"
  "pillow"
  "pipenv"
  "darksky_weather"
)

install "pip3 install" "${pyArr[@]}"

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
  "voices"
  "mocha"
  "chai"
  "jasmine"
  "@cloudflare/wrangler"
)

install "npm -g i" "${jsArr[@]}"

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install git clones, cloning alone works with install(), but pushing to directory doesn't
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# amix vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
# emmet-vim
git clone https://github.com/mattn/emmet-vim.git ~/.vim_runtime/my_plugins/emmet-vim
# molokai
git clone https://github.com/tomasr/molokai.git ~/.vim_runtime/my_plugins/molokai
# vim-javascript
git clone https://github.com/pangloss/vim-javascript.git ~/.vim_runtime/my_plugins/vim-javascript
# vim-jsdoc
git clone https://github.com/heavenshell/vim-jsdoc.git ~/.vim_runtime/my_plugins/vim-jsdoc
# vim-jsx
git clone https://github.com/mxw/vim-jsx.git ~/.vim_runtime/my_plugins/vim-jsx
# YouCompleteMe
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim_runtime/my_plugins/YouCompleteMe
python3 ~/.vim_runtime/my_plugins/YouCompleteMe/install.py --all

# install cheat.sh
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh
