#!/bin/sh
# chmod a+x installBackups.sh

# install brew dependencies
xcode-select --install

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/springfield/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/springfield/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
