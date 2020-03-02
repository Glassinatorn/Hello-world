# colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export PATH="$PATH:$HOME/bin"
export EDITOR=nvim

# prompt
PS1='Glass $ '

# aliases
alias ls="ls --color=auto"
alias la="ls -la"
alias yt="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mkv"
alias ssd='sudo mount /dev/$(ls /dev | grep sd | dmenu_center) /mnt/ssd/'
alias usb='sudo mount /dev/$(ls /dev | grep sd | dmenu_center) /mnt/usb/'
alias remake="make && sudo make install && make clean"
alias v="nvim"
alias n="nnn"
alias vmap='sudo nvim $(ls /usr/share/nvim/runtime/plugin/map_* | fzf)'
alias vdoc='sudo nvim $(ls /usr/share/nvim/runtime/doc/doc* | fzf)'
alias upd="sudo pacman -Syu"
alias inst="sudo pacman -S"
alias gu="git fetch && git pull"
alias gs="git status"
alias gc="git commit -m"
alias gp="git push"
alias gb="git branch"
alias sr="sudo systemctl restart"
alias tmx='tmux a -t $(tmux ls | awk '\''{print $1}'\''| sed s/://g | fzf)'

# loading nnn config
source ~/.config/nnn/rc
stty -ixon

# including rust
export PATH="$HOME/.cargo/bin:$PATH"
