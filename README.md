# Repository Overview

## Overview
This repository curates 22 tracked files spanning Python (14 files), Shell (6 files), YAML (1 files) and Text (1 files). It showcases automation around data analysis workflows, ci/cd automation, HTTP integrations and command-line interfaces. Expect utilities for audio extraction utilities, media conversion scripts, email automation helpers, repository setup tooling and market data ingestion.

## Key Features
- **chk_os.py** — Identify the current operating system and run platform-specific hooks. It detects the host operating system and invokes system commands. The Adapter class coordinates operating-system routines such as Run App, macOS, Windows 10, Linux and other helpers.
- **clone.sh** — Clone a Git repository into a specified directory with a single command. Run `chmod +x clone.sh` once, then call `./clone.sh <repo-url> <target-dir>`. It clones remote Git repositories into the requested directory.
- **createRepo.py** — Bootstrap a Git repository locally and create the remote on GitHub. It touches the local filesystem and environment variables and invokes system commands. Run commands in the terminal.
- **videoToMp3/mkvToH264.sh** — It converts media files with FFmpeg.
- **emailLib.py** — Helpers for authenticating with IMAP servers and managing mailboxes. It monitors inbox folders. The Email Account class coordinates key routines such as Get Server Address. The Use IMAP class coordinates key routines such as Get IMAP Server, Select Folder, Get Folder List, Get Num Of Emails and other helpers.
- **videoToMp3/mkvToMp3.sh** — It converts media files with FFmpeg.
- **filelib.py** — Utilities for creating, inspecting, and editing files on disk. It touches the local filesystem and environment variables. The File System class coordinates key routines such as Set Path, Get Contents, Create File, Use Default Path and other helpers.
- **videoToMp3/mp4ToH264.sh** — It converts media files with FFmpeg.
- **iex.py** — IEX API data. It parses and emits JSON payloads, structures data with pandas DataFrames and communicates with HTTP services. IEX API.
- **videoToMp3/mp4ToMp3.sh** — It converts media files with FFmpeg.
- **jsonToPanda.py** — Converts JSON to table for readability with pandas api. It structures data with pandas DataFrames. [+] Converts JSON file from IEX API into a table with pandas dataframe api.
- **videoToMp3/webmToMp3.sh** — It converts media files with FFmpeg.
- **reindent.py** — CLI utility to convert indentation widths for a text file. It touches the local filesystem and environment variables. The Reindent class coordinates key routines such as Is Exist, Get Contents and Reindent.
- **rename_files.py** — A simple script for renaming file or folder name(s). Key highlights: replace character(s) with new character(s), add new character(s) before or after the filename, delete character(s) in the filename. It parses command-line arguments for flexible execution and touches the local filesystem and environment variables. The Rename class coordinates key routines such as Rename.
- **rpn.py** — Evaluate reverse Polish notation expressions with verbose tracing.
- **sendEmailAuto.py** — Send templated emails to multiple recipients using SMTP. It builds MIME email messages, touches the local filesystem and environment variables and sends transactional email via SMTP.
- **sendEmailPrompt.py** — Prompt-based email composer that collects recipients and sends via SMTP. It builds MIME email messages, touches the local filesystem and environment variables and sends transactional email via SMTP.
- **text_to_mp3/run.py** — Convert each line in `text.txt` into spoken audio and export MP3 files. It invokes system commands.
- **waiting_instruction.py** — Automates a Gmail-driven workflow that launches a local alarm clock app. It builds MIME email messages, monitors inbox folders, touches the local filesystem and environment variables and sends transactional email via SMTP. Open a command prompt and start the Windows alarm-volume-control app.
- **weather.py** — Generate Dark Sky forecasts and read them aloud in English or Japanese. It retrieves weather insights from Dark Sky, touches the local filesystem and environment variables and invokes system commands.

## Getting Started
1. Clone the repository and open it in your preferred development environment.
2. Create a virtual environment and install the required Python packages.

## Running the Project
Use these commands to explore key entry points:
- `bash clone.sh`
- `python createRepo.py`
- `python iex.py`
- `python jsonToPanda.py`
- `python reindent.py`
- `python rename_files.py`
- `bash videoToMp3/mkvToH264.sh`
- `bash videoToMp3/mkvToMp3.sh`
- `bash videoToMp3/mp4ToH264.sh`
- `bash videoToMp3/mp4ToMp3.sh`
