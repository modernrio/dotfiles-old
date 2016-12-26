#------------------------------------------------------------------------------#
#                              Default Variables                               #
#------------------------------------------------------------------------------#
export EDITOR="vim"
export PAGER="less"
export BROWSER="firefox"
export MAIL="mutt"
export MOVPLAY="mpv"
export PICVIEW="feh"
export SNDPLAY="mpv"
export DOCVIEWER="zathura"
export TERMINAL="termite"
export PULSE_LATENCY_MSEC=60
export TERM="xterm-256color"
export ETH_IF="eno1"

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
ZSH_CUSTOM=~/.config/zsh/themes/

# Set name of the theme to load
ZSH_THEME="powerlevel9k"

# Customize powerlevel9k
POWERLEVEL9k_MODE='awesome-patched'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode time)
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
POWERLEVEL9K_VCS_UNTRACKED_ICON=''
POWERLEVEL9K_VCS_UNSTAGED_ICON=''
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Change the command execution time stamp shown in the history command output.
HIST_STAMPS="dd.mm.yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Set your language environment
export LANG=en_US.UTF-8

# Set x11 keyboard map
setxkbmap de,de

# Set zsh cache directory
ZSH_CACHE_DIR=$HOME/.oh-my-zsh-cache
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Autocompletion
autoload -Uz compinit
compinit

#------------------------------------------------------------------------------#
#                                External files                                #
#------------------------------------------------------------------------------#

# Source aliases
source $HOME/.aliases

# Source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Source Xilinx ISE
export PATH=/opt/Xilinx/14.7/ISE_DS/ISE/bin/lin64:$PATH

# Add ruby binaries to PATH
export PATH=~/.gem/ruby/2.3.0/bin:$PATH

#------------------------------------------------------------------------------#
#                                   Options                                    #
#------------------------------------------------------------------------------#

# Set console to vi mode
set -o vi

# Suppress python byte code
export PYTHONDONTWRITEBYTECODE="true"

# Why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# 10 second wait if you do something that will delete everything.
setopt RM_STAR_WAIT

# Beeps are annoying
setopt NO_BEEP

# If a line starts with a space, don't save it.
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# Save the time and how long a command ran
setopt EXTENDED_HISTORY

# Extended globbing and expansion
setopt extendedglob

# Stop <Ctrl-s> to suspend the tty
stty -ixon
