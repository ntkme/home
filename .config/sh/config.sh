#!/bin/sh

# This file will load under following conditions
# `sh --login`
# `bash`
# `zsh`

case $(uname) in
  Darwin)
    test -x /usr/local/bin/brew && eval "$(/usr/local/bin/brew shellenv)"
    ;;
  Linux)
    test -x /home/linuxbrew/.linuxbrew/bin/brew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -x "$HOME/.linuxbrew/bin/brew" && eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"

    alias ls='ls --color=auto'
    ;;
esac

alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color=auto'
