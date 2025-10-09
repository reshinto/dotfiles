# Dotfiles Overview

## Overview
This repository collects the configuration files and bootstrap scripts I use to reproduce my development environment across macOS, Linux, and Windows. It includes editor preferences, terminal tooling, and platform-specific installers so a fresh machine can be configured quickly with the same tooling and customizations I rely on every day.【F:mac/installApps.sh†L1-L80】【F:ubuntu/installBackups.sh†L1-L47】【F:windows/install_backup.ps1†L1-L4】

## Features
- **Automated macOS setup.** `mac/installApps.sh` extends the PATH for Homebrew, defines a helper to batch-install packages, and installs an extensive collection of command-line tools, languages, and utilities that power my daily workflow.【F:mac/installApps.sh†L4-L77】
- **Ubuntu environment bootstrap.** `ubuntu/installBackups.sh` updates the system, installs core CLI dependencies, provisions Oh My Zsh, configures Vim and Spacemacs, and pulls in additional productivity tools for a Linux workstation.【F:ubuntu/installBackups.sh†L6-L43】
- **Windows quick start.** `windows/install_backup.ps1` sets Chocolatey up and installs essential Windows development applications so the environment is ready for coding.【F:windows/install_backup.ps1†L1-L4】
- **Editor customization.** `.spacemacs` loads a curated set of Spacemacs layers for languages, tooling, and productivity features ranging from Python and JavaScript support to Git integration and theming tweaks.【F:.spacemacs†L1-L73】
- **Terminal enhancements.** The `bin/battery-status` script prints a battery indicator suited for shell prompts, and the `neofetch_config` profile highlights host details like IP addresses, display resolution, and CPU/GPU information when inspecting system state.【F:bin/battery-status†L1-L37】【F:neofetch_config/config.conf†L3-L38】

## Usage
Clone the repository into your home directory and run the installer that matches your platform (for example, `mac/installApps.sh` on macOS). Individual configuration files such as `.spacemacs` or the contents of `neofetch_config` can also be symlinked or copied into place if you only need specific tooling tweaks.【F:mac/installApps.sh†L4-L77】【F:.spacemacs†L1-L73】【F:neofetch_config/config.conf†L3-L38】
