#!/bin/sh

# This file will load under following conditions
# `sh -l`
# `bash`
# `dash -l`
# `zsh`

set -o vi

. ~/.env

case "$(uname)" in
  Darwin)
    test -z "$HOMEBREW_PREFIX" && test -x /usr/local/bin/brew && eval "$(SHELL=/bin/sh /usr/local/bin/brew shellenv)"

    test -z "$DOCKER_HOST" && command -v docker-machine >/dev/null && eval "$(docker-machine env 2>/dev/null)"

    test -z "$JAVA_HOME" && JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null) && export JAVA_HOME
    ;;
  Linux)
    test -z "$HOMEBREW_PREFIX" && test -x ~/.linuxbrew/bin/brew && eval "$(SHELL=/bin/sh ~/.linuxbrew/bin/brew shellenv)"
    test -z "$HOMEBREW_PREFIX" && test -x /home/linuxbrew/.linuxbrew/bin/brew && eval "$(SHELL=/bin/sh /home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    alias ls='ls --color=auto'
    ;;
esac

alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color=auto'
