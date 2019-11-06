#   -*- shell-script -*-

# Default PATH to something useable
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# XDG directories
### http://rafi.io/shell/pimp-up-your-shell/
#mw These shouldn't be necessary as they're all the defaults from
#   https://specifications.freedesktop.org/basedir-spec/latest/ar01s03.html
export XDG_CONFIG_HOME="$HOME/.config"
export  XDG_CACHE_HOME="$HOME/.cache"
export   XDG_DATA_HOME="$HOME/.local/share"

# Explicit ordering instead of just globbing the directory
for SUBFILE in functions exports secrets lattice; do
    [[ -r "$XDG_CONFIG_HOME/bash/$SUBFILE" ]] && source "$XDG_CONFIG_HOME/bash/$SUBFILE"
done

#mw Confusing. Add bashrc, inputrc back into the list above if we find a need.
# [ -r "$XDG_CONFIG_HOME/bash/functions" ] && . "$XDG_CONFIG_HOME/bash/bashrc"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for SUBFILE in completion aliases; do
    [[ -r "$XDG_CONFIG_HOME/bash/$SUBFILE" ]] && source "$XDG_CONFIG_HOME/bash/$SUBFILE"
done

