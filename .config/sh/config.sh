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
    test -z "${HOMEBREW_PREFIX+_}" && test -x /usr/local/bin/brew && eval "$(SHELL=/bin/sh /usr/local/bin/brew shellenv)"

    test -z "${DOCKER_HOST+_}" && command -v docker-machine >/dev/null && eval "$(docker-machine env 2>/dev/null)"

    test -z "${JAVA_HOME+_}" && JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null) && export JAVA_HOME  || unset JAVA_HOME
    ;;
  Linux)
    test -z "${HOMEBREW_PREFIX+_}" && test -x ~/.linuxbrew/bin/brew && eval "$(SHELL=/bin/sh ~/.linuxbrew/bin/brew shellenv)"
    test -z "${HOMEBREW_PREFIX+_}" && test -x /home/linuxbrew/.linuxbrew/bin/brew && eval "$(SHELL=/bin/sh /home/linuxbrew/.linuxbrew/bin/brew shellenv)"

    alias ls='ls --color=auto'
    ;;
esac

alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color=auto'
alias docker-compose='docker run --rm \
    --hostname "$(hostname -f)" \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w "$PWD" \
    docker/compose:1.27.3'
