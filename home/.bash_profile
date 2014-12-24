## EXPORTS ##
CVS_RSH=ssh
export CVS_RSH
if [ -d /opt/chefdk/bin ]; then
	export PATH=/opt/chefdk/bin:$PATH
fi
EDITOR=$(which vim)
export EDITOR
export DISTCC_DIR=/var/tmp/portage/.distcc/
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if [[ "$OSTYPE" == "darwin"* ]]; then
	export TMUX_DEFAULT_COMMAND="reattach-to-user-namespace -l ${SHELL}"
else
	export TMUX_DEFAULT_COMMAND="${SHELL}"
fi

if [ -d ~/bin ]; then
	export PATH=~/bin:$PATH
fi

# For homesick scripts
if [ -d ~/.bin ]; then
	export PATH=~/.bin:$PATH
fi

if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if [ $(command -v boot2docker) ]; then
  $(boot2docker shellinit >/dev/null 2>&1)
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
