# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/your-user-name/.oh-my-zsh"
export GPG_TTY=`tty`

# Sets the zsh custom directory
ZSH_CUSTOM=$HOME/.dotfiles/ZSH_CUSTOM

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=random

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=("godzilla" "nanotech" "sorin" "theunraveler")

# Enable nice fuzzy tab completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
# Visualize and selecting with arrow keys in completion.
zstyle ':completion:*' menu select
# Ignore case in tab complete.
# Refresh tab completion from PATH automatically, so hash(1) does not need to be called after installing a new program.
zstyle ':completion:*' rehash true
# Complete options for aliases too.
setopt completealiases
# Ignore case in tab complete.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit
compinit

# Enable colors
autoload -U colors && colors

# Command history
export HISTSIZE=1000000                        # How many lines in the current session to remember.
export SAVEHIST=1000000                        # How many lines to save to disk. Must be <=HISTSIZE.
setopt appendhistory                               # Append to history write on exit, don't overwrite.
bindkey "^R" history-beginning-search-backward # Complete from history with prefix
bindkey "^E" history-beginning-search-forward  # Complete from history with prefix

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh
