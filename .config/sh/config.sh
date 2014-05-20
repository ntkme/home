#!/bin/sh

# This file will load under following conditions
# `sh --login`
# `bash`
# `zsh`

# Prepend /usr/local/bin for Homebrew
test -x /usr/local/bin/brew && export PATH=/usr/local/bin:`echo ":$PATH:" | sed -e "s:\:/usr/local/bin\::\::g" -e "s/^://" -e "s/:$//"`

# Prepend $HOME/.linuxbrew/bin for Linuxbrew
test -x "$HOME/.linuxbrew/bin/brew" && export PATH="$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin:$PATH"

# Alias
alias ll='ls -lh'
alias la='ls -lAh'
alias grep='command grep --color=auto'

case $(uname) in
  Darwin)
    ;;
  Linux)
    alias ls="command ls --color=auto"
    ;;
esac
