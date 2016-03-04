#!/bin/sh

# This file will load under following conditions
# `sh --login`
# `bash`
# `zsh`

# Prepend /usr/local/bin for Homebrew
test -x /usr/local/bin/brew && export PATH=/usr/local/bin:`echo ":$PATH:" | sed -e "s:\:/usr/local/bin\::\::g" -e "s/^://" -e "s/:$//"`

# Prepend /opt/local/bin for Linuxbrew
test -x /opt/local/bin/brew && export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# Alias
alias ll='ls -lh'
alias la='ls -lAh'
alias grep='command grep --color=auto'

case $(uname) in
  Darwin)
    ;;
  Linux)
    alias ls='command ls --color=auto'
    ;;
esac
