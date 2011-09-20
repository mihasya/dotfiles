# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# ls aliases
alias ls='ls -AF'
alias ll='ls -la'
alias la='ls -A'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export USERCOLOR="\e[37;1m"
export HOSTCOLOR="\e[1;32;1m"
if [ "$HOSTNAME" == "shiny" ]; then
	export HOSTCOLOR="\e[1;33;1m"
elif [ "$HOSTNAME" == "mihasya.xen.prgmr.com" ]; then
	export HOSTCOLOR="\e[1;31;1m"
fi

if [ `id -u` == 0 ]; then
    DONG="#"
else
    DONG="$"
fi

export PS1="[\t $USERCOLOR\u\e[37;1m @ $HOSTCOLOR\H\e[0m] \w \n$DONG "
export MYSQL_PS1="(\u@\h) [\d] > "

if [ -f /etc/profile.d/sandbox.sh ]; then
	. /etc/profile.d/sandbox.sh
fi

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -cf sudo

export TERM='xterm-256color'

# turn off flow control so that vim can catch ctrl-s
stty -ixoff
