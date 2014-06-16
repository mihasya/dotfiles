#!/bin/sh

SH_FILES="bashrc bash_aliases bash_profile zshrc zsh.d gitconfig gitignore vimrc vim gvimrc ackrc screenrc ctags turtle bin tmux.conf"
BACKUP="backups/`date +'%Y%m%d-%H%M%S'`"
SHDIR=$PWD

for FILE in $SH_FILES; do
    if [ -e "$HOME/.$FILE" -o -L "$HOME/.$FILE" ]; then
        if [ -L "$HOME/.$FILE" ]; then
            echo "not backing up ~/.$FILE, it is a symlink -> `readlink $HOME/.$FILE`"
            rm "$HOME/.$FILE"
        else
            echo "backing up ~/.$FILE"
            mkdir -p $BACKUP
            mv "$HOME/.$FILE" "$BACKUP/$FILE"
        fi
    fi
    echo "installing $FILE"
    ln -s "$SHDIR/.$FILE" "$HOME/.$FILE"
done

(cd $HOME/.vim && ./update)
mkdir -p ~/.vimundo

git submodule update --init

if [ ! -e ~/.rbenv ]; then
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
	~/.rbenv/bin/rbenv install 1.9.3-p547
	~/.rbenv/bin/rbenv global 1.9.3-p547
fi
