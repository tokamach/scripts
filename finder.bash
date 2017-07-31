#!/usr/bin/env bash

# finder integration utilities
# taken from the finder bits of github.com/oh-my-fish/plugin-osx
# github.com/tokamach

# launch quicklook
function ql() {
    [ -z "$1" ] && exit
    qlmanage &>/dev/null -p $argv &
}

# print finder path
function pfd() {
    osascript 2>/dev/null -e '
    tell application "Finder"
    	 return POSIX path of (target of window 1 as alias)
    end tell'
}

# cd to finder path
function cdf() {
    cd $(pfd)
}


# print finder selection
function pfs() {
  osascript 2>/dev/null -e '
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set output to output & ((item item_index of the_selection as alias)'\''s POSIX path) & the_delimiter
    end repeat'
}

# open finder
function fnd() {
    open -a Finder $argv
}

