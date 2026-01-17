#!/bin/sh
# chmod a+x installBackups.sh

set -euo pipefail

# Update App urls here
urls=(
  "https://admin.stimulsoft.com/install/Stimulsoft-Designer-2026.1.2.dmg"
  "https://go.microsoft.com/fwlink/?linkid=2325438&clcid=0x409&culture=en-us&country=us"
)

# brew cask
# https://formulae.brew.sh/
brewCaskArr=(
  "iterm2"
  "google-chrome"
  "firefox"
  "postman"
  "rectangle"
  "visual-studio-code"
  "microsoft-teams"
  "docker-desktop"
  "chatgpt"
  "windows-app"
  "corretto@21"
  "microsoft-outlook"
  "aws-vpn-client"
  "onedrive"
  "sourcetree"
)

# brew packages
# https://formulae.brew.sh/
brewArr=(
  "grunt-cli"
  "awscli"
  "pyenv"
  "nvm"
)

# python3 packages
#pyArr=(
#  ""
#)

# npm packages
jsArr=(
  "typescript"
  "ts-node"
)

###########################################################
# Install Xcode CLT only if missing for homebrew dependencies
if ! xcode-select -p >/dev/null 2>&1; then
  xcode-select --install
fi

###########################################################
# Download Apps via urls while waiting for xcode-select to be installed
downloadurls() {
  # Usage: download OUTDIR URL1 URL2 ...
  export OUTDIR="$1"
  shift
  local JOBS="${JOBS:-4}"

  # Print URLs being downloaded
  echo "Downloading (${#@}) URL(s):"
  for u in "$@"; do
    echo "  - $u"
  done

  run_downloads() {
    printf '%s\0' "$@" | xargs -0 -n 1 -P "$JOBS" bash -c '
      set -euo pipefail
      url="$1"
      outdir="${OUTDIR%/}"

      rawname="$(basename "${url%%\?*}")"

      # If URL has extension, save directly
      if [[ "$rawname" == *.* ]]; then
        /usr/bin/curl --fail --location --retry 3 --retry-delay 2 \
          --silent --show-error \
          -o "$outdir/$rawname" \
          "$url"
        exit 0
      fi

      # No extension: download to temp, infer name from final redirected URL
      tmpfile="$(mktemp "$outdir/download.XXXXXX")"
      effective_url="$(
        /usr/bin/curl --fail --location --retry 3 --retry-delay 2 \
          --silent --show-error \
          -o "$tmpfile" \
          -w "%{url_effective}" \
          "$url"
      )"

      base="${effective_url%%\?*}"
      filename="$(basename "$base")"

      # If still generic/empty, fall back
      lower="$(printf "%s" "$filename" | tr "[:upper:]" "[:lower:]")"
      if [[ -z "$filename" || "$lower" == "fwlink" || "$lower" == "download" || "$lower" == "index" || "$lower" == "file" || "$lower" == "get" ]]; then
        host="$(printf "%s" "$effective_url" | awk -F/ "{print \$3}")"
        filename="${host:-downloaded_file}"
      fi

      filename="${filename// /_}"
      final="$outdir/$filename"
      mv -f "$tmpfile" "$final"

      # If still no extension, add .pkg when it’s a signed installer package
      if [[ "$filename" != *.* ]]; then
        if /usr/sbin/pkgutil --check-signature "$final" >/dev/null 2>&1; then
          mv -f "$final" "${final}.pkg"
        fi
      fi
    ' _
  }

  # Run downloads in background
  run_downloads "$@" &
  local pid=$!

  # Spinner while background job runs (macOS bash 3.2 compatible)
  local spin='-\|/'
  local i=0
  while kill -0 "$pid" 2>/dev/null; do
    i=$(( (i + 1) % 4 ))
    printf "\r... %c" "${spin:$i:1}"
    /bin/sleep 0.1
  done

  # Collect exit status
  wait "$pid"
  printf "\rDownloading... done\n"
}

# Remember to manually install these apps once download has completed
downloadurls "$HOME/Downloads" "${urls[@]}"

###########################################################
# Install Homebrew only if missing, requires xcode-select to be installed
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

###########################################################
# Set paths
BASH_RC="$HOME/.bash_profile"
touch "$BASH_RC"

append_if_missing() {
  local line="$1"
  local file="$2"
  grep -Fqx "$line" "$file" || echo "$line" >> "$file"
}

ensure_dir() {
  local dir="$1"
  if [ ! -d "$dir" ]; then
    mkdir -p "$dir"
  fi
}

# Add Homebrew bin to PATH
append_if_missing 'export PATH="$PATH:/opt/homebrew/bin"' "$BASH_RC"

# Add pyenv to PATH
append_if_missing 'export PYENV_ROOT="$HOME/.pyenv"' "$BASH_RC"
append_if_missing 'export PATH="$PYENV_ROOT/bin:$PATH"' "$BASH_RC"
append_if_missing 'eval "$(pyenv init -)"' "$BASH_RC"

# nvm directory
ensure_dir "$HOME/.nvm"

# Add nvm to bash startup
append_if_missing 'export NVM_DIR="$HOME/.nvm"' "$BASH_RC"
append_if_missing 'HOMEBREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"' "$BASH_RC"
append_if_missing '[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm' "$BASH_RC"
append_if_missing '[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && . "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion' "$BASH_RC"

# Load updated profile for this run
source "$BASH_RC"

# Create directories only if missing
ensure_dir "$HOME/.aws"
ensure_dir "$HOME/nuvo-prime"
ensure_dir "$HOME/.ssh"

###########################################################
# Install apps from homebrew, npm, etc
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

# install mac apps with brew cask
install "brew install --cask" "${brewCaskArr[@]}"

# install brew packages
install "brew install" "${brewArr[@]}"

# install latest python version
pyenv install -f $(pyenv install --list | grep -v - | grep -v b | tail -1)
pyenv global -f $(pyenv install --list | grep -v - | grep -v b | tail -1)
pyenv rehash

# install python packages with pip3
#install "pip3 install" "${pyArr[@]}"

# Use nvm to install the latest lts Node.js and use it
# export NVM_DIR="$HOME/.nvm"
# . "$(brew --prefix)/opt/nvm/nvm.sh"
nvm install --lts

nvm alias default node
nvm use default

# install nodejs packages with npm from nvm
install "npm -g i" "${jsArr[@]}"

###########################################################
# Setup ssh key only if missing
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N ""
fi
