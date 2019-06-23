#!/bin/bash


if [ `uname` = "Linux" ]; then
    if [ `lsb_release -is` = "Ubuntu" ]; then
        sudo -- sh -c 'apt update;
        apt upgrade -y;
        apt full-upgrade -y;
        apt autoremove -y;
        apt autoclean -y;
        apt install curl -y;
        apt install wget -y;
        apt install npm -y;

        apt install zsh -y;
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'

        . ~/.zshrc

        sudo -- sh -c '
        apt install build-essential -y;

        apt remove -y vim-tiny;
        apt install -y vim'
        git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
        sh ~/.vim_runtime/install_awesome_vimrc.sh

        wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
        unzip 1.050R-it.zip
        mkdir -p ~/.fonts
        cp source-code-pro-*-it/OTF/*.otf ~/.fonts/
        fc-cache -f -v
        git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

        sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
        echo 'deb https://repo.windscribe.com/ubuntu zesty main' | sudo tee /etc/apt/sources.list.d/windscribe-repo.list
        sudo apt install windscribe-cli -y

        sudo apt install torbrowser-launcher -y
        sudo apt install ranger -y
        sudo apt install cmus -y
    fi
elif [ `uname` = "Darwin" ]; then
    echo "This is a mac"
fi
