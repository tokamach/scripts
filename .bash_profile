[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

function macfeh() {
    [ -z "$1" ] && return
    open -b "drabweb.macfeh" $@
}

function waifucation() {
    FOLDER=$(terminal-notifier -message "which folder?" -reply -json | jq -r .activationValue)
    IMG=$(find ~/Pictures/animu/$FOLDER -type f | egrep ".*\.(png|jpg)" | gsort -R | tail -1)
    macfeh $IMG
}

function wifeh() {
    IMG=$(find ~/Pictures/animu/$1 -type f | egrep ".*\.(png|jpg)" | gsort -R | tail -1)
    macfeh $IMG
}

function wife() {
    IMG=$(find ~/Pictures/animu/$1 -type f | egrep ".*\.(png|jpg)" | gsort -R | tail -1)
    imgcat $IMG
}

function jisho() {
    open "http://jisho.org/search/$*"
}

# exports
export EDITOR=nvim
export PATH="$PATH:~/.bin"
export PS1="\w ❥ "

#go shit
export GOPATH=$HOME/code/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

