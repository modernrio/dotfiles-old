#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set console to use vi mode
set -o vi

# Set keyboard map to german layout
setxkbmap de,de

# Activate numlock
numlockx on

# Suppress python byte code
export PYTHONDONTWRITEBYTECODE="true"

#------------------------------------------------------------------------------#
#                              Default Variables                               #
#------------------------------------------------------------------------------#

export EDITOR="nvim"
export PAGER="less"
export BROWSER="firefox"
export MAIL="mutt"
export MOVPLAY="mpv"
export PICVIEW="feh"
export SNDPLAY="mpv"
export DOCVIEWER="zathura"
export TERMINAL="uxterm"
export PULSE_LATENCY_MSEC=60
export TERM="xterm-256color"
export ETH_IF="eno1"

#------------------------------------------------------------------------------#
#                                   Aliases                                    #
#------------------------------------------------------------------------------#

## File Extensions
for ext in html org php com net no;		do alias $ext=$BROWSER; done
for ext in txt tex py PKGBUID;			do alias $ext=$EDITOR; done
for ext in png jpg gif;					do alias $ext=$PICVIEW; done
for ext in mp4 mpg wmv avi mkv;			do alias $ext=$MOVPLAY; done
for ext in wav mp3 ogg;					do alias $ext=$SNDPLAY; done
for ext in pdf;							do alias $ext=$DOCVIEWER; done

## Python
alias py='python'
alias py2='python2'
alias py3='python3'

## Fun
alias aquarium='asciiquarium'
alias starwars='telnet towel.blinkenlights.nl'

## Directories
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -Ahsl'
alias lA='ls -ahsl'
alias l='ls -Clh'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias lP='l ~/Pictures'
alias lD='l ~/Downloads'
alias cD='cd ~/Downloads'
alias cdC='cd ~/.config'
alias cdD='cd ~/dotfiles'
alias cdE='cd ~/Projects/EPU'
alias cdH='cd /mnt/hdd'
alias cdM='cd ~/Music/'
alias cdP='cd ~/Projects/'
alias cdS='cd ~/Scripts'
alias cdV='cd ~/.vim'

## Reloading configs
alias rB='source ~/.bashrc'
alias rX='xrdb -merge ~/.Xresources'

## Metasploit
#alias msfconsole=' msfconsole -x "db_connect msf@msf"'

## Editing shortcuts
alias e='$EDITOR'
alias e3='$EDITOR ~/.config/i3/config'
alias eB='$EDITOR ~/.bashrc && rB'
alias eV='$EDITOR ~/.vimrc'
alias eF='sudo $EDITOR /root/activate-firewall.sh && sudo bash /root/activate-firewall.sh'
alias eX='$EDITOR ~/.Xresources && rX'
alias eI='$EDITOR ~/.xinitrc'
alias eP='sudo $EDITOR /etc/pacman.conf'
alias eT='$EDITOR ~/.config/termite/config'
alias eG='$EDITOR ~/.gitconfig'
alias ec='crontab -e'
alias eC='sudo crontab -e'
alias eS='$EDITOR ~/.sshrc'

## Misc
alias k='exit'
alias shutdown='shutdown -P now'
alias C='clear'

#------------------------------------------------------------------------------#
#								 Color options								   #
#------------------------------------------------------------------------------#

## Customize colors for ls
#LS_COLORS=$LS_COLORS:'ex=0;35:' ; export LS_COLORS

#------------------------------------------------------------------------------#
#								 Functions									   #
#------------------------------------------------------------------------------#

## Check if websites are down
down4me() { curl -s "http://www.downforeveryoneorjustme.com/$1" | sed '/just you/!d;s/<[^>]*>//g';}

## Check interal and external IPs
checkip() {
	echo "--------------- Network Information ---------------"
	ip addr | awk '/global/ {print $1,$2}' | cut -d\/ -f1
	ip addr | awk '/global/ {print $3,$4}'
	ip addr | awk '/ether/ {print $1, $2}'
	ip addr | awk '/scope link/ {print $1,$2}' | cut -d\/ -f1

	echo External IP $(curl -s http://checkip.dyndns.org/ | grep -o "[[:digit:].]\+")
	echo "---------------------------------------------------"
}

PS1='[\u@\h \W]\$ '
