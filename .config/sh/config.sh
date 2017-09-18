#!/bin/sh

# This file will load under following conditions
# `sh --login`
# `bash`
# `zsh`

# Prepend /usr/local/bin for Homebrew
test -x /usr/local/bin/brew && export PATH=/usr/local/bin:`echo ":$PATH:" | sed -e "s:\:/usr/local/bin\::\::g" -e "s/^://" -e "s/:$//"`

# Prepend /home/linuxbrew/.linuxbrew/bin for Linuxbrew
if test -x /home/linuxbrew/.linuxbrew/bin/brew; then
  export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:`echo ":$PATH:" | sed -e "s:\:/home/linuxbrew/.linuxbrew/bin\::\::g" -e "s:\:/home/linuxbrew/.linuxbrew/sbin\::\::g" -e "s/^://" -e "s/:$//"`
  export MANPATH=/home/linuxbrew/.linuxbrew/share/man:$MANPATH
  export INFOPATH=/home/linuxbrew/.linuxbrew/share/info:$INFOPATH
fi

# Alias
alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color=auto'

case $(uname) in
  Darwin)
    ;;
  Linux)
    alias ls='ls --color=auto'
    ;;
esac
