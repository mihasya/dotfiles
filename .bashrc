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

if [ "x$CONQUE" != "x" ]; then
    DONG="(conque) $DONG"
fi

load_pyenv;

function refresh_prompt() {
    export MVN=`mvn_get`
    if [ "x$VIRTUAL_ENV" = "x" ]; then
	PY="base"
    else
	PY=`basename $VIRTUAL_ENV`
    fi
    RB=`ruby --version | cut -d ' ' -f 2`
    export PS1="[\t $USERCOLOR\u\e[37;1m @ $HOSTCOLOR\H\e[0m :: mvn: $MVN python: $PY ruby: $RB ] \w \n$DONG "
    # awesome iTerm2 things http://www.iterm2.com/#/section/documentation/escape_codes
    # do something special for linux hosts
    if [ -f /etc/issue ]; then
	echo -ne "\033]Ph25002E\033\\"
    else
	echo -ne "\033]Ph000000\033\\"
    fi

    # color the tabs thanks to iTerm being awesome
    if [ -f /etc/issue ]; then
	COLOR=`hostname | md5sum`
    else
	COLOR=`md5 -q -s $HOSTNAME`
    fi
    echo -ne "\033]6;1;bg;red;brightness;$((0x${COLOR:0:2}))\a"
    echo -ne "\033]6;1;bg;green;brightness;$((0x${COLOR:2:2}))\a"
    echo -ne "\033]6;1;bg;blue;brightness;$((0x${COLOR:4:2}))\a"
}

export PROMPT_COMMAND=refresh_prompt;

export MYSQL_PS1="(\u@\h) [\d] > "

if [ -f /etc/profile.d/sandbox.sh ]; then
	. /etc/profile.d/sandbox.sh
fi

complete -W "$(echo `cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | uniq | grep -v "\["`;)" ssh
complete -cf sudo

export TERM='xterm-256color'

# turn off flow control so that vim can catch ctrl-s
stty -ixon

export PATH="$HOME/bin:/opt/manual/bin:$PATH"
BREW_EXISTS="$(brew --version > /dev/null 2>&1 || echo no)"
if [ "xno" != "x$BREW_EXISTS" ]; then
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    export PATH="$(brew --prefix findutils)/bin:$PATH"
    export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
    export MANPATH="$(brew --prefix findutils)/share/man:$MANPATH"
fi
export GOPATH="$HOME"

if [ -f /usr/go/bin/go ]; then
    export PATH="$PATH:/usr/go/bin"
    export GOROOT="/usr/go"
elif [ -f /usr/local/go/bin/go ]; then
    export PATH="$PATH:/usr/local/go/bin"
fi

export EDITOR=vim
set -o vi

# grep niceness
# TODO: does this work on osx? test.. man page would seem to say no
export GREP_OPTIONS="--binary-files=without-match --directories=skip --color=auto"
export GREP_COLORS="ms=01;31:mc=01;31:sl=:cx=:fn=01;32:ln=01;37:bn=32:se=36"


# rbenv
export PATH="$HOME/.rbenv/bin:$PATH" >> ~/.bash_profile
eval "$(rbenv init -)"

# chefdk
export PATH="/opt/chefdk/bin:/opt/chefdk/embedded/bin:$PATH"

function set_gopack_gopath() {
    export GOPATH=$PWD/.gopack/vendor:$HOME
}
function set_godeps_gopath() {
    export GOPATH=$PWD/Godeps/_workspace:$HOME
}

export GOPATH=$HOME
export GOBIN=$GOPATH/bin
export GOROOT=/usr/local/go
