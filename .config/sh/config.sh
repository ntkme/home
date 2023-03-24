#!/bin/sh

# This file will load under following conditions
# `sh -l`
# `bash`
# `dash -l`
# `zsh`

set -o vi

. ~/.env
. ~/.config/sh/functions/brew-shellenv

case "$(uname)" in
  Darwin)
    test -z "${DOCKER_HOST+_}" && command -v docker-machine >/dev/null && eval "$(docker-machine env 2>/dev/null)"

    test -z "${JAVA_HOME+_}" && JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null) && export JAVA_HOME || unset JAVA_HOME
    ;;
  Linux)
    alias ls='ls --color=auto'
    ;;
esac

alias ll='ls -lh'
alias la='ls -lAh'
alias grep='grep --color=auto'
