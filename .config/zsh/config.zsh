#!/bin/zsh

# Zsh function path
fpath=( ~/.config/zsh/functions ~/.config/bash/functions ~/.config/sh/functions "${fpath[@]}" )

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=65535
SAVEHIST=65535
setopt append_history hist_ignore_dups hist_ignore_space

# Settings
setopt nomatch
setopt auto_list auto_menu
unsetopt autocd beep extendedglob notify

if [ -z "$LS_COLORS" ]; then
  command -v dircolors &>/dev/null || autoload -U dircolors # LS_COLORS for Non-GNU system
  eval $(dircolors -b)
fi

# Completion
autoload -U compinit && compinit
zstyle ':completion:*:default' list-colors "$LS_COLORS"
zstyle ':completion:*:*:-command-:*' tag-order 'functions:-non-comp *' functions
zstyle ':completion:*:functions-non-comp' ignored-patterns '_*'
zstyle ':completion:*:processes' menu yes select
zstyle ':completion:*:processes' force-list always
zstyle ':completion:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Prompt
autoload -U zsh_prompt_float && zsh_prompt_float

# Edit Command Line
autoload -U edit-command-line
zle -N edit-command-line

# fzf
function {
  [ $? -ne 0 ] && return 1

  if [[ $- == *i* ]]; then
    source "$1/shell/completion.zsh"

    if command -v fd &>/dev/null; then
      _fzf_compgen_path () {
        command fd --hidden --follow --exclude ".git" --exclude ".svn" "$1"
      }

      _fzf_compgen_dir () {
        command fd --type d --hidden --follow --exclude ".git" --exclude ".svn" . "$1"
      }
    fi
  fi

  source "$1/shell/key-bindings.zsh"
} "$(function {
    [ $? -ne 0 ] && return 1

    while cd "$(dirname "$1")" && set "$(basename "$1")" && test -L "$1"; do
      set "$(readlink "$1")"
    done

    cd .. && pwd -P
  } "$(command -v fzf)")"

# Key Bindings
bindkey -v
bindkey -r '\e,'
bindkey '^H' backward-delete-char
bindkey '^?' backward-delete-char

bindkey '\e\e' edit-command-line
bindkey -a '\e\e' edit-command-line

if type fzf-history-widget &>/dev/null; then
  bindkey '^R' fzf-history-widget
  bindkey '\e/' fzf-history-widget
  bindkey '\e?' fzf-history-widget
  bindkey -a '/' fzf-history-widget
  bindkey -a '?' fzf-history-widget
else
  bindkey '^R' history-incremental-pattern-search-backward
  bindkey '\e/' history-incremental-pattern-search-backward
  bindkey '\e?' history-incremental-pattern-search-forward
  bindkey -a '/' history-incremental-pattern-search-backward
  bindkey -a '?' history-incremental-pattern-search-forward
fi
