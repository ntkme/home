# Zsh function path
fpath=( ~/.config/zsh/functions ~/.config/bash/functions ~/.config/sh/functions "${fpath[@]}" )

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt append_history hist_ignore_dups hist_ignore_space

# Settings
setopt nomatch
setopt auto_list auto_menu
unsetopt autocd beep extendedglob notify

if [ -z "$LS_COLORS" ]; then
  [ -n "$(command -v dircolors)" ] || autoload -U dircolors # LS_COLORS for Non-GNU system
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

# Editing
bindkey -v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd '\e' edit-command-line
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

# Prompt
autoload -U zsh_smart_prompt && zsh_smart_prompt
