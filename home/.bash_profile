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

if [[ "$OSTYPE" == "darwin"* ]]; then
	export PATH="/usr/local/sbin:${PATH}"
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
# New node garbage (it will never die)
#
if [ -d $HOME/.nvm ]; then
	export NVM_DIR="/home/josh/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
fi

#
# Dalias
#
if [ -d $HOME/.dalias ] || [ -L $HOME/.dalias ]; then
	export PATH="$HOME/.dalias/bin:$PATH"
	eval "$(dalias init)"
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
# docker-machine
#
if [ $(command -v docker-machine) ]; then
	eval $(docker-machine env default)
fi

#
# Keychain/SSH stuffs
#
load_keys() {
	if [ $(command -v keychain) ]; then
		KEYS=()
		public_keys=$(find $HOME/.ssh -name \*.pub)
		for public_key in $public_keys; do
			private_key=$(basename $public_key .pub)
			if [[ -f "$(dirname $public_key)/$private_key" ]]; then
				KEYS+=("$private_key")
			fi
		done
		eval $(keychain --eval --agents ssh --inherit any ${KEYS[@]})
	fi
}

if [ -h $HOME/.ssh/ssh_auth_sock ]; then
	export SSH_AUTH_SOCK=$HOME/.ssh/ssh_auth_sock
fi

load_keys

#
# Now, source the juicy bits
#
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# vim: set ft=sh
