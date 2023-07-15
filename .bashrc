#   -*- shell-script -*-
# .bashrc is executed for interactive, non-login shells
# .bash_profile is executed for login shells
# (MacOS Terminal.app runs a login shell for for each new terminal window.)

# DEBUG=1
[ $DEBUG ] && echo "in .bashrc"

# Default PATH to something useable if necessary.
if [ -z "$PATH" ]; then export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin; fi

# XDG directories
### http://rafi.io/shell/pimp-up-your-shell/
#mw These shouldn't be necessary as they're all the defaults from
#   https://specifications.freedesktop.org/basedir-spec/latest/ar01s03.html
export XDG_CONFIG_HOME="$HOME/.config"
export  XDG_CACHE_HOME="$HOME/.cache"
export   XDG_DATA_HOME="$HOME/.local/share"

# Fixes for partially XDG compliant apps
# Ref. https://wiki.archlinux.org/index.php/XDG_Base_Directory
export INPUTRC="$XDG_CONFIG_HOME"/bash/inputrc

source_file() {
	[[ -r "$XDG_CONFIG_HOME/bash/$1" ]] && source "$XDG_CONFIG_HOME/bash/$1"
}

# Explicit ordering instead of just globbing the directory
# add bashrc, inputrc back into the list if/when needed
for SUBFILE in functions exports secrets lattice; do
    source_file $SUBFILE
done

# If not running interactively, don't load any more
[[ $- != *i* ]] && return

# for SUBFILE in completion aliases prompt lattice-aliases; do
for SUBFILE in completion aliases prompt; do
    source_file $SUBFILE
done

if [[ $TERM_PROGRAM = "iTerm.app" ]]; then
    source_file iterm2_shell_integration.bash
fi

pathdedupe
