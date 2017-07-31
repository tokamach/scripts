[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source ~/code/scripts/finder.bash

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

function remove_duplicates_in_animu_folder() {
    if [ -eq $(pwd) "/Users/tom/Pictures/animu" ] ; then
        echo "===WARNING==="
        echo "Running this function can delete waifus indiscriminately."
        read -p "Are you sure? " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]] ; then
            fdupes 2hu/ gabriel_dropout/ chuu2/ madoka_magica/ k-on/ -r -n -d -N
        fi
    else
        echo "===WARNING==="
        echo "Run this from the ~/Pictures/animu folder"
    fi
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

