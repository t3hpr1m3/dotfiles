## EXPORTS ##
CVS_RSH=ssh
export CVS_RSH
PATH=$PATH:~/bin
export PATH
export EDITOR
EDITOR=$(which vim)
XSESSION="Xfce4"
export XSESSION
export DISTCC_DIR=/var/tmp/portage/.distcc/
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if [ -d ~/bin ]; then
	export PATH=:~/bin:$PATH
fi

# For homesick scripts
if [ -d ~/.bin ]; then
	export PATH=:~/.bin:$PATH
fi

if [ -d $HOME/.rbenv ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi
