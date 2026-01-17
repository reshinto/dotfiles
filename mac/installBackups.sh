#!/bin/sh
# chmod a+x installBackups.sh

set -euo pipefail

###########################################################
# Install Xcode CLT only if missing for homebrew dependencies
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
fi

###########################################################
# Install Homebrew only if missing
# This will install Xcode CLT if missing
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

###########################################################
# Setup brew shellenv line (idempotency not handled here)
ZPROFILE="$HOME/.zprofile"
echo >> "$ZPROFILE"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$ZPROFILE"
eval "$(/opt/homebrew/bin/brew shellenv)"

# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
