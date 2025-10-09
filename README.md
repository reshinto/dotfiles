# Repository Overview

## Overview
The repository contains Shell (6 files), YAML (1 files), Zsh Theme (1 files), Vim (1 files), combining 14 tracked files across application and documentation assets. Detected themes include database access layers, containerisation, interactive front-end views, Azure platform tooling, deep learning, command-line interfaces, giving a quick sense of the problem domains the code addresses. Highlighted focus areas include repository setup tooling, repository cloning workflows, market data ingestion.

## Key Features
- **mac/CMD/installApps.sh** — !/bin/sh chmod a+x installApps.sh.
- **bin/battery-status** — #!/bin/bash # # From https://github.com/holman/dotfiles/blob/master/bin/battery-status # and from https://github.com/notwaldorf/.not-quite-dotfiles/blob/master/bin/battery-status # # battery-status # # A quick little indicator for battery status on your Mac l….
- **mac/MacPowerChimeConfig** — // Turn off Power Chime when plugging in power source to Mac defaults write com.apple.PowerChime ChimeOnNoHardware -bool true killall PowerChime.
- **windows/install_backup.ps1** — Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')) c….
- **.vim_runtime/my_configs.vim** — " Enable indentation during command mode nnoremap <Tab> >>_ " Enable unindentation during command mode nnoremap <S-Tab> <<_ " Enable indentation and unindentation during insert mode inoremap <S-Tab> <C-D> " Enable indentation during visual mode vnoremap <Tab>….
- **.oh-my-zsh/themes/mytheme.zsh-theme** — ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}" ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} " ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗" ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})" local ret_status="%(?:%{$fg_bold[green]%….
- **mac/CMD/installBackups.sh** — !/bin/sh chmod a+x installBackups.sh. It performs HTTP requests from the shell.
- **mac/installApps.sh** — !/bin/sh chmod a+x installApps.sh. It clones remote Git repositories into the requested directory, converts media files with FFmpeg, chains additional Python utilities, executes Node.js package scripts and performs HTTP requests from the shell.
- **mac/installBackups.sh** — !/bin/sh chmod a+x installBackups.sh. It performs HTTP requests from the shell.

## Getting Started
1. Clone the repository and open it in your preferred development environment.

## Running the Project
Use these commands to explore key entry points:
- `bash mac/CMD/installApps.sh`
- `bash mac/CMD/installBackups.sh`
- `bash mac/installApps.sh`
- `bash mac/installBackups.sh`
- `bash mac/old/installBackups.sh`
- `bash ubuntu/installBackups.sh`
- `pwsh windows/install_backup.ps1`
