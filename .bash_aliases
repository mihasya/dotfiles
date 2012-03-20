alias apt-install-latest='sudo aptitude update; sudo aptitude install -y $@; aptitude show $@'

alias startvm='VBoxManage startvm --type=headless'
function stopvm() { VBoxManage controlvm "$@" poweroff; }
