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

# brew cask, this will keep prompting you to key in password
# https://caskroom.github.io/search
brewCaskArr=(
  "iterm2"
  "anaconda"
  "vlc"
  "google-chrome"
  "google-hangouts"
  "firefox"
  "whatsapp"
  "dropbox"
  "mactex"
  "virtualbox"
  "virtualbox-extension-pack"
  "mysqlworkbench"
  "android-file-transfer"
  "android-studio"
  "appcleaner"
  "cheatsheet"
  "falcon-sql-client"
  "kitematic"
  "github"
  "grammarly"
  "mongodb-compass-community"
  "nvidia-geforce-now"
  "pgadmin4"
  "postman"
  "rectangle"
  "spotify"
  "sublime-text"
  "tor-browser"
  "unity"
  "epic-games"
  "vagrant"
  "vagrant-manager"
  "yt-music"
  "slack"
  "dash"
  "force-paste"
  "diffmerge"
  "db-browser-for-sqlite"
  "ngrok"
  "dotnet-sdk"
  "azure-data-studio"
  "xquartz"
  "unpkg"
  "visual-studio-code"
  "licecap"
  "react-native-debugger"
  "reactotron"
  "audacity"
  "nordvpn"
  "visualvm"
  "zoom"
  "microsoft-teams"
  "macfuse"
  "telegram"
  "docker"
  "microsoft-edge"
  "drawio"
  "google-cloud-sdk"
  "lens"
  "dbeaver-community"
  "voov-meeting"
  "wechat"
  "chatgpt"
)

install "brew install --cask" "${brewCaskArr[@]}"

# brew packages
brewArr=(
  "pyenv"
  "pyenv-virtualenv"
  "wget"
  "macvim"
  "nvm"
  "yarn"
  "http-server"
  "opencv"
  "mysql"
  "postgresql@15"
  "cmus"
  "tiny-html5"
  "neofetch"
  "mps-youtube"
  "heroku/brew/heroku"
  "chrome-cli"
  "darksky-weather"
  "docker"
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
  "vifm"
  "pipenv"
  "java"
  "jenkins-lts"
  "groovy"
  "intellij-idea-ce"
  "nginx"
  "redis"
  "springboot"
  "maven"
  "jenv"
  "kotlin"
  "MinGW-w64"
  "minikube"
  "gradle"
  "kubectx"
  "grpcurl"
  "velero"
  "blackhole-2ch"
  "codex"
)

install "brew install" "${brewArr[@]}"

# install git clones, cloning alone works with install(), but pushing to directory doesn't
# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# amix vimrc, allow vim configurations
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

# omnisharp-vim
git clone https://github.com/OmniSharp/omnisharp-vim.git ~/.vim_runtime/my_plugins/omnisharp-vim

# YouCompleteMe
git clone --recursive https://github.com/ycm-core/YouCompleteMe.git ~/.vim_runtime/my_plugins/YouCompleteMe
python3 ~/.vim_runtime/my_plugins/YouCompleteMe/install.py --all

curl https://raw.githubusercontent.com/reshinto/dotfiles/master/.vim_runtime/my_configs.vim > ~/.vim_runtime/my_configs.vim

# install cheat.sh
curl https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh

# install latest python version
pyenv install $(pyenv install --list | grep -v - | grep -v b | tail -1)
pyenv global $(pyenv install --list | grep -v - | grep -v b | tail -1)
pyenv rehash

# python3 packages
pyArr=(
  "tqdm"
  "jedi"
  "pillow"
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
  "serve"
  "@cloudflare/wrangler"
  "sql-cli"
  "typescript"
  "ts-node"
  "carbon-now-cli"
)

install "npm -g i" "${jsArr[@]}"

# Use nvm to install the latest Node.js and use it
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix)/opt/nvm/nvm.sh"
nvm install --lts

nvm alias default node
nvm use default
