#
# ~/.bash_profile
#

# Source .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X after boot login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	startx
fi
