#
# ~/.xinitrc
#

# Disable mouse acceleration
xset m 0 0

# Set screen resolutions
setres --port HDMI-1 1920 1080
setres --port DVI-I-1 1280 1024
bash ~/.screenlayout/screen.sh
feh --bg-scale /home/whoami/Pictures/wallpaper.jpg

# Set keyboard layout
setxkbmap de,de

# Remap Capslock to escape
setxkbmap -option caps:escape

# Set numlock
numlockx on

# Run i3wm
exec i3
