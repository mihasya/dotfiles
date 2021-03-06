#!/bin/bash

alias apt-install-latest='sudo aptitude update; sudo aptitude install -y $@; aptitude show $@'

alias startvm='VBoxManage startvm --type=headless'
function stopvm() { VBoxManage controlvm "$@" poweroff; }

function mvn_select() {
    if [ -f ~/.m2/settings.xml ]; then
        if [ -L ~/.m2/settings.xml ]; then
            rm ~/.m2/settings.xml;
        else
            echo "settings.xml exists, but is not a symlink.. I'm scared!"
            return;
        fi
    fi
    
    SETTINGS=$@
    
    if [ "x$SETTINGS" = "x" ]; then
        echo "Please specify which mvn settings you'd like to use"
        return;
    fi
    
    SETTINGS_PATH="$HOME/.m2/settings.xml_$@"
    if [ -f "$SETTINGS_PATH" ]; then
        ln -s $SETTINGS_PATH ~/.m2/settings.xml
    else
        echo "No mvn settings available for $@";
        return;
    fi
}

function mvn_get() {
    if [ -L ~/.m2/settings.xml ]; then
        MVN=`readlink -n ~/.m2/settings.xml | cut -f 2 -d "_"`
        echo $MVN;
    fi
}


# load up our current python env, similar to mvn_select
function load_pyenv() {
    if [ -L ~/pyenv/current ]; then
        PYENV=`readlink -n ~/pyenv/current`
        PYENV="$HOME/pyenv/$PYENV"
    elif [ -f ~/pyenv/default ]; then
        PYENV="$HOME/pyenv/default"
    fi
    if [ "x$PYENV" != "x" ]; then
        . "$PYENV/bin/activate"
    fi
}

function select_pyenv() {
    # TODO
    echo;
}
