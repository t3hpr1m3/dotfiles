#
# vi mode ftw
#
set -o vi

for file in $HOME/.{aliases,docker_wrappers,functions}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		. $file
	fi
done
unset file

# Terminal capabilities
local256="$COLORTERM$XTERM_VERSION$ROXTERM_ID$KONSOLE_DBUS_SESSION"
if [ -n "$local256" ]; then
	case "$TERM" in
		'xterm' | 'xfce4-terminal') TERM=xterm-256color;;
		'screen') TERM=screen-256color;;
		'Eterm') TERM=Eterm-256color;;
	esac

	export TERM
fi
unset local256

# Transparency
if [ -n "$XTERM_VERSION" ] && [ $(command -v transset) ]; then
	transset --id "$WINDOWID" 0.85 >/dev/null
fi

# Change the window title of X terminals
case $TERM in
	xterm*|rxvt*|Eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac
export PS1="\[\033[37m\]\w\n\[\033[31m\]\u@\h: \[\033[1;33m\]\$(/usr/bin/tty | sed -e 's:/dev/::')\[\033[0m\] \[\033[1;32m\]\$(parse_git_branch)\[\033[0m\] -> \[\033[0m\]"

# Homeshick
if [[ -f ~/.homesick/repos/homeshick/homeshick.sh ]]; then
	source ~/.homesick/repos/homeshick/homeshick.sh
fi

# TMUX DISPLAY setting
if [ -n "$DISPLAY" ]; then
	if [ $(command -v tmux) ]; then
		for name in `tmux ls -F '#{session_name}' 2>/dev/null`; do
			tmux setenv -t $name DISPLAY $DISPLAY
			tmux setenv -g -t $name DISPLAY $DISPLAY
		done
	fi
fi

# vim: set ft=sh:
