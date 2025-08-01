export ZSH_TMUX_AUTOSTART=true
export ZSH=$HOME/.oh-my-zsh
# homebrew needs to go first so that things like tmux can be found
export PATH="/opt/homebrew/bin:$PATH"
plugins=(git zsh-z)

if ! env | grep -qE "(VSCODE|IDEA|INTELLIJ)"; then
    plugins+=(tmux)
fi

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

# User configuration

export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
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

eval `/usr/libexec/path_helper -s`

which rbenv > /dev/null && eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### PYTHON
# use brew'd python
export PATH="/opt/homebrew/opt/python@3.11/libexec/bin:$PATH"
alias python=python3
alias pip=pip3

# psql cli
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

if which op &>/dev/null; then
    alias load-openai-key="source <(echo \"export OPENAI_API_KEY={{ op://Private/openai-api-key/password }}\" | op inject --account $(op accounts list | grep mihasya.com | tr -s ' ' | cut -f 3 -d ' '))"
else
    echo "op binary not available, cannot setup credential loading functions"
fi

alias code=cursor
