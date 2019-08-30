# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
setopt COMPLETE_ALIASES

# aliases
source ~/.profile

# keybindings
bindkey '^[[1;5C'	forward-word
bindkey '^[[1;5D'	backward-word
bindkey '^L'		clear-screen
