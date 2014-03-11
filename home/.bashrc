## COLORS ##
if which dircolors >/dev/null; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if [[ -f ~/.dir_colors ]]; then
		eval `dircolors -b ~/.dir_colors`
	elif [[ -f /etc/DIR_COLORS ]]; then
		eval `dircolors -b /etc/DIR_COLORS`
	else
		eval `dircolors -b`
	fi
	alias ls='ls --color=auto'
else
	alias ls='ls -G'
fi

## ALIAS ## 
alias l="ls -l -h"
alias df="df -h"
alias gview="gvim -m -R"
alias gvime="gvim -u ~/code/engine/misc/vimrc"
alias gvimv="gvim -u ~/.vimrcv"
alias p="ps faux"
alias vimmate="vimmate > /dev/null 2>&1"

alias dmon="DISTCC_DIR=/var/tmp/portage/.distcc distccmon-text"

alias halt='sudo /sbin/halt'
alias reboot='sudo /sbin/reboot'

alias es='gvim src/*.cpp include/*.h'
alias annotate='annotate -p before'
alias top='sudo top'

# Change the window title of X terminals 
case $TERM in
	xterm*|rxvt*|Eterm)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
		;;
	screen)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
		;;
esac
function parse_git_dirty {
	[[ $(git status --porcelain 2> /dev/null | tail -n1) != "" ]] && echo "*"
}
function parse_git_branch {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1="\[\033[37m\]\w\n\[\033[31m\]\u@\h: \[\033[1;33m\]\$(/usr/bin/tty | sed -e 's:/dev/::')\[\033[0m\] \[\033[1;32m\]\$(parse_git_branch)\[\033[0m\] -> \[\033[0m\]"

# for SSH stuff
if [[ -f ~/.keychain/$HOSTNAME-sh ]]; then
	keychain ~/.ssh/id_dsa
	. ~/.keychain/$HOSTNAME-sh
fi

# Homeshick?
if [[ -f ~/.homesick/repos/homeshick/homeshick.sh ]]; then
	source ~/.homesick/repos/homeshick/homeshick.sh
fi

tmup(){
	echo -n "Updating to latest tmux environment...";
	export IFS=",";
	for line in $(tmux showenv -t $(tmux display -p "#S") | tr "\n" ","); do
		if [[ $line == -* ]]; then
			unset $(echo $line | cut -c2-);
		else
			export $line;
		fi
	done
	unset IFS
	echo "Done";
}
