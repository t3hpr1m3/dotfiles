## EXPORTS ##
#
# Man, I'm old
#
export CVS_RSH=ssh
export EDITOR=$(which vim)
export DISTCC_DIR=/var/tmp/portage/.distcc/
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#
# Needed to get copy/paste from tmux/ssh working
#
if [[ "$OSTYPE" == "darwin"* ]]; then
	export TMUX_DEFAULT_COMMAND="reattach-to-user-namespace -l ${SHELL}"
else
	export TMUX_DEFAULT_COMMAND="${SHELL}"
fi

#
# For local scripts not part of homesick
#
if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH
fi

#
# For homesick scripts
#
if [ -d ~/.bin ]; then
	export PATH=~/.bin:$PATH
fi

#
# Old ruby garbage (will this ever die?)
#
if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

#
# Go language stuffs
#
if [[ -d /usr/local/go/bin ]]; then
	export PATH=/usr/local/go/bin:$PATH
fi
if [ -f $HOME/.gopath ]; then
	export GOPATH=$(eval echo $(cat $HOME/.gopath))
	export PATH="$GOPATH/bin:$PATH"
fi

#
# Needed until docker machine comes of age
#
if [ $(command -v boot2docker) ]; then
  $(boot2docker shellinit >/dev/null 2>&1)
fi

#
# Keychain/SSH stuffs
#
if [ $(command -v keychain) ]; then
	KEYS=()
	if [[ -f ~/.ssh/id_dsa ]]; then
		KEYS+=('id_dsa')
	fi
	if [[ -f ~/.ssh/id_rsa ]]; then
		KEYS+=('id_rsa')
	fi
	eval $(keychain --eval --agents ssh --inherit any ${KEYS[@]})
fi

#
# Now, source the juicy bits
#
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# vim: set ft=sh
