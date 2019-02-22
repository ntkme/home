#!/bin/sh

# This file will load under following conditions
# `sh --login`
# `bash`
# `zsh`

set -a
. ~/.env
set +a

case $(uname) in
  Darwin)
    test -z ${HOMEBREW_PREFIX:+null} && test -x /usr/local/bin/brew && eval "$(SHELL=/bin/sh /usr/local/bin/brew shellenv)"
    ;;
  Linux)
    test -z ${HOMEBREW_PREFIX:+null} && test -x /home/linuxbrew/.linuxbrew/bin/brew && eval "$(SHELL=/bin/sh /home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    test -z ${HOMEBREW_PREFIX:+null} && test -x ~/.linuxbrew/bin/brew && eval "$(SHELL=/bin/sh ~/.linuxbrew/bin/brew shellenv)"

    alias ls='ls --color=auto'
    ;;
esac

alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color=auto'
