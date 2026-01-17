#!/usr/bin/env zsh
# chmod a+x updatePath.sh

echo export PATH=$PATH:/opt/homebrew/bin >> .zshrc

# add pyenv to path
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

# use nvm to install latest version of node
mkdir ~/.nvm

# Add nvm to your shell startup file (so nvm works in every new terminal)
printf '\nexport NVM_DIR="$HOME/.nvm"\n[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm\n[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion\n' >> ~/.zshrc

source ~/.zshrc
