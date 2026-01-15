#!/bin/sh
# chmod a+x installBackups.sh

# install brew dependencies
xcode-select --install

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

ZPROFILE="$HOME/.zprofile"

echo >> "$ZPROFILE"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$ZPROFILE"
eval "$(/opt/homebrew/bin/brew shellenv)"

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
