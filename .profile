#!/bin/bash
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$PATH:/var/lib/snapd/snap/bin:/home/kpfromer/.gem/ruby/2.6.0/bin:/home/kpfromer/.npm-global/bin:$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')"
export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="google-chrome-stable"
export READER="zathura"
export FILE="ranger"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/.referbib"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"
export PIX="$HOME/.pix/"
export PLAYER="spotify" # This value is used in lmc for playerctl to control in this case playerctl will control only spotify

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

[ ! -f ~/.shortcuts ] && shortcuts >/dev/null 2>&1

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if i3 not already running.
# Run i3 on login!!!!!!!!!!!!!!!!!!!!
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null
