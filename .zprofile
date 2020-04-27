# Call "startx" when logged in
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# source profile, which has all the environment variables
source $HOME/.profile