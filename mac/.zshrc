# Display neofetch application
neofetch

# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Anaconda path
export PATH="/usr/local/anaconda3/bin:$PATH"

# Mac OS software update path
export PATH="/usr/sbin/:$PATH"

# Homebrew path
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

# port path
export PATH="/opt/local/bin:$PATH"
export PATH="/opt/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/springfield/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
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

# update and upgrade everything
# automate sudo command without input password with "echo password | sudo -S command"
alias sue="sudo softwareupdate -i -a && brew update && brew upgrade && brew cleanup && brew cleanup -s && conda clean -ay"

# auto remove everything and clean
alias aur="brew cleanup && brew cleanup -s && conda clean -ay"

# Java home path
export JAVA_HOME="`/usr/libexec/java_home -v 10`"

# email and password
source /Users/springfield/.authentication.sh

# tor
alias tor="open -a 'tor browser'"

# Dev shortcut
alias dev="cd /Volumes/Speed/Dev"

# delete Spam emails
alias dspam="python3 /Users/springfield/my_apps/delete-spam-automation/run.py"
alias pspam="python3 /Users/springfield/my_apps/delete-spam-automation/run.py manual"

# tensorflow conda env shortcut
alias tf="source activate tf"

# visualization conda env shortcut
alias viz="source activate visualization"

# conda activate
alias sa="source activate"

# conda deactivate
# alias sdc="source deactivate"  deprecated
alias cdc="conda deactivate"

# conda list env
alias cel="conda env list"

# youtube viewing and download
alias yt="mpsyt"

# create python2 virtual environment
alias ven2="virtualenv venv"

# create python3 virtual environment
alias ven="virtualenv -p python3 venv"

# activate python virtual environment
alias sva="source venv/bin/activate"

# deactivate python virtual environment
alias dc="deactivate"

# facebook messenger
#alias fb="sudo fb-messenger-cli"

# windscribe vpn connect
alias wsv="open -a windscribe"

# Chrome
alias chrome='open -a "Google Chrome"'

# IntelliJ Idea
alias idea='open -a "IntelliJ IDEA"'

# spacemacs
alias evim='emacs -nw'

# compile .cpp files (C++)
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

# alarm clock
alias alarm="python3 /Users/springfield/my_apps/alarm-volume-control/run_app.py"

# flask tutorial secret key and database
source /Users/springfield/.flaskTutorialTemp.sh

# rename file or folder names
alias rename="python3 /Volumes/Speed/Dev/Python_projects/My_Projects/Automation/rename_files/rename_files.py"

#alias mongod='mongod --dbpath /Users/springfield/data/db'

# control my SG home LG tv
export PATH="/Volumes/Speed/Dev/Python_projects/My_Projects/inDevelopment/hack_myTv/LGWebOSRemote:$PATH"
alias atv="sa atv"
alias tv="python3 /Volumes/Speed/Dev/Python_projects/My_Projects/inDevelopment/hack_myTv/LGWebOSRemote/lgtv.py"

# webDev yelp-camp tutorial
export DATABASEURL="mongodb://localhost:27017/yelp_camp"

# CLOUDINARY API NAME KEY AND SECRET
source /Users/springfield/.CLOUDINARYAPI.sh

# github username
export githubUser="reshinto"

# python project default path
export pyProject="/Volumes/Speed/Dev/Python_projects/My_Projects/inDevelopment"

# web javascript project default path
export webProject="/Volumes/Speed/Dev/Web_projects/my_projects"

# create new project automatically
alias create="python3 /Users/springfield/my_apps/Automate_Building_projects/run.py"

# reindent file automatically
alias re="python3 /Users/springfield/my_apps/Reindent/main.py"

# run python server
alias pserver="python3 -m http.server"

# run html server
alias server="http-server"

# Sudo Update All (include spam deletion)
alias sua="sudo softwareupdate -i -a && brew update && brew upgrade && brew cleanup && brew cleanup -s && python3 /Users/springfield/my_apps/delete-spam-automation/run.py && npm update -g && pip3 install --upgrade pip && pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip3 install -U --user && conda install anaconda -y && conda update --all -y && conda clean -ay"

# mySQL
alias mysqlstart="brew services start mysql"
alias mysql="mysql -u root -p"
alias mysqlrestart="brew services restart mysql"
alias mysqlstop="brew services stop mysql"
# Change mySQL password
# mysqladmin -u root password 'yourpassword'

# postgresql
alias pgstart="brew services start postgresql"
alias pgstop="brew services stop postgresql"
