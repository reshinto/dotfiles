# Dotfiles

## Overview
This repository captures the configuration files and bootstrap scripts I use to recreate my development environment on macOS, Linux, and Windows. It covers editor preferences, terminal tooling, and platform-specific installers so a fresh machine can be configured quickly with the same tools and customizations I rely on every day.

## Features
- **Automated macOS setup.** `mac/installApps.sh` extends the PATH for Homebrew, defines a helper to batch-install packages, and installs a curated collection of command-line tools, languages, and utilities that power my workflow.
- **Ubuntu environment bootstrap.** `ubuntu/installBackups.sh` updates the system, installs core CLI dependencies, provisions Oh My Zsh, configures Vim and Spacemacs, and pulls in additional productivity tools for a Linux workstation.
- **Windows quick start.** `windows/install_backup.ps1` configures Chocolatey and installs essential Windows development applications so the environment is ready for coding.
- **Editor customization.** `.spacemacs` loads a curated set of Spacemacs layers for languages, tooling, and productivity features ranging from Python and JavaScript support to Git integration and theming tweaks.
- **Terminal enhancements.** The `bin/battery-status` script prints a battery indicator suited for shell prompts, and the `neofetch_config` profile highlights host details like IP addresses, display resolution, and CPU/GPU information when inspecting system state.

## Usage
Clone the repository into your home directory and run the installer that matches your platform (for example, `mac/installApps.sh` on macOS). Individual configuration files such as `.spacemacs` or the contents of `neofetch_config` can also be symlinked or copied into place if you only need specific tooling tweaks.
