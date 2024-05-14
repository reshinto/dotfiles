# get disk size
df / | sed '1d' |
    awk '
        /^\/dev\/disk1s4s1/ {
            size_byte = $2 * 512            # df uses 512 byte blocks
            avail_byte = $4 * 512
            total_size_gb = size_byte / 1000000000
            total_avail_gb = avail_byte / 1000000000

            printf "Size: %.1f GB     Free: %.1f GB\n", total_size_gb, total_avail_gb
        }
    '

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# export PATH="/usr/local/opt/openjdk/bin:$PATH"
ZSH_THEME="mytheme"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 1

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    battery
    python
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR=vim

export GIT_EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# update and upgrade everything
# automate sudo command without input password with "echo password | sudo -S command"
alias sue="sudo softwareupdate -i -a && brew update && brew upgrade && brew cleanup && brew cleanup -s"

# auto remove everything and clean
alias aur="brew cleanup && brew cleanup -s"

# tor
alias tor="open -a 'tor browser'"

# Dev shortcut
alias sdev="cd /Volumes/Speed/dev"
alias dev="cd $HOME/Documents/dev"

# create python3 virtual environment
alias ven="virtualenv -p python3 venv"

# activate python virtual environment
alias sva="source venv/bin/activate"

# deactivate python virtual environment
alias dc="deactivate"

# Chrome
alias chrome='open -a "Google Chrome"'

# alarm clock
alias alarm="python $HOME/Documents/my_apps/alarm-volume-control/run_app.py"

# run python server
alias pserver="python -m http.server"

# run html server
alias server="http-server"

# set default vim
alias vim="mvim -v"

# automate git clone, folder create, and cd
alias clone="source $HOME/Documents/my_apps/clone.sh"

# find current folder size
alias sz="du -sh"

# list all available node_modules
alias listnode="find . -name 'node_modules' -type d -prune | xargs du -chs"

# delete all node_modules
alias delnode="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"

# login to cloud
alias sshcloud="ssh reshinto@cloud_ip_address"

# docker node env, arg1: expose port, arg2: docker port, arg3: path
function dnode() { docker run -it --rm -p $1:$2 -v $3:/app -w='/app' node bash }

# docker python env, arg1: expose port, arg2: docker port, arg3: path
function dpython() { docker run -it --rm -p $1:$2 -v $3:/app -w='/app' python bash }

# icloud path
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"

# check which app is using port
function portcheck() { lsof -i :$@ }

# kill port with PID
alias killport="kill -9"

# Stop all docker containers
#alias dstop="docker kill $(docker ps -q)"

# Remove all docker containers
#alias drm="docker rm $(docker ps -a -q)"

# Remove all docker images
#alias drmi="docker rmi -f $(docker images -aq)"

# Stop and remove all docker containers and images
#alias dclearall="dstop && drm && drmi"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# postgres
export PATH="/usr/local/opt/postgresql@15/bin:$PATH"
