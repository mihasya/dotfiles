export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="mihasya"

DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/.zsh.d

plugins=(git)

# User configuration

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/Users/mihasya/src/go.datanerd.us/p/meatballs/infra/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"

# golang
export GOPATH=$HOME
export PATH="$HOME/bin:/opt/chefdk/embedded/bin:/usr/local/go/bin:$PATH"
export GOPATH=$HOME
export GOBIN=$HOME/bin

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# wire up default docker-machine if one isn't loaded
if [ "x$DOCKER_HOST" = "x" ]; then
	eval "$(docker-machine env default)"
fi

eval `/usr/libexec/path_helper -s`

# counter Sophos
alias fixbrew='sudo chown mihasya:admin /usr/local/bin'
alias brew='fixbrew && brew'


# NVM commented out because it's dog slow
# export NVM_DIR="$HOME/.nvm"
# . "$(brew --prefix nvm)/nvm.sh"
# rbenv commented out because it too is sorta slow
# export PATH="$HOME/.rbenv/bin:$PATH"
# eval "$(rbenv init -)"
