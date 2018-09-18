# display neofetch application
neofetch

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/springfield/.oh-my-zsh


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# added by Anaconda3 installer
#export PATH="/home/springfield/anaconda3/bin:$PATH"

#export my_email=""
#export my_email_password=""

# add Android studio
#export PATH="/opt/android-studio/bin:$PATH"

# add intellij
#export PATH="/opt/idea-IC-182.3911.36/bin:$PATH"

# delete Spam emails
#export PATH="/media/xxx:$PATH"
#alias dspam="python /media/xxx/xxx.py"
#alias pspam="python /media/xxx/xxx.py"

# CUDA toolkit 9.0
#export PATH=/usr/local/cuda-9.0/bin${PATH:+${PATH}}
#export LD_LIBRARY_PATH=/usr/local/cuda/lib64:${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}}
#export PATH=/usr/local/cuda-9.0/bin:$PATH
#export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH

# tor
#alias tor="torbrowser-launcher /usr/bin/torbrowser-launcher"

# Dev shortcut
#alias dev="cd /media/xxx"

# tensorflow conda env shortcut
#alias tf="source activate tf"

# conda activate
#alias sa="source activate"

# conda deactivate
#alias sdc="source deactivate"

# conda list env
#alias cel="conda env list"

# update ubuntu
#alias sud="sudo apt update && sudo apt-get update"

# apt update, upgrade, autoremove in ubuntu
#alias sua="sudo -- sh -c 'apt update; apt upgrade -y; apt full-upgrade -y; apt autoremove -y; apt autoclean -y'"

# apt-get update, upgrade, autoremove in ubuntu
#alias suag="sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'"

# apt & apt-get update, upgrade, autoremove in ubuntu # not required to do both though
#alias sue="sudo -- sh -c 'apt update; apt upgrade -y; apt full-upgrade -y; apt autoremove -y; apt autoclean -y; apt-get update; apt-get upgrade -y; apt-get dist-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'"

# auto remove and autoclean
#alias aur="sudo -- sh -c 'apt autoremove -y; apt autoclean -y; apt-get autoremove -y; apt-get autoclean -y'"

# youtube viewing and download
#alias yt="mpsyt"

# google chrome
#alias chrome="google-chrome"

# create python2 virtual environment
#alias ven2="virtualenv venv"

# create python3 virtual environment
#alias ven="virtualenv -p python3 venv"

# activate python virtual environment
#alias sva="source venv/bin/activate"

# deactivate python virtual environment
#alias dc="deactivate"

# facebook messenger
#alias fb="sudo fb-messenger-cli"

# windscribe vpn connect
#alias wsc="windscribe connect"

# windscribe vpn disconnect
#alias wsdc="windscribe disconnect"
