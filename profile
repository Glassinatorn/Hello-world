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

# git
alias gu="git fetch && git pull"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gb="git branch"

# cargo
alias cr="clear && cargo run"
alias ct="clear && cargo test"
alias cn="cargo new --vcs git"

# nvim
alias v="nvim"
alias sv="sudo nvim"
alias vskel='sudo nvim $(ls /usr/share/nvim/runtime/skeletons/* | fzf)'
alias vmap='sudo nvim $(ls /usr/share/nvim/runtime/plugin/map_* | fzf)'
alias vdoc='sudo nvim $(ls /usr/share/nvim/runtime/doc/doc* | fzf)'

# graphviz
alias graph="dot -Tpng -o graph.png"

# dir management
alias ls="ls --color=auto"
alias la="ls -la"
alias n="nnn"

# various
alias sr="sudo systemctl restart"
alias tm='tmux a -t $(tmux ls | awk '\''{print $1}'\'' | sed s/://g | fzf)'
alias murder='kill $(ps -e | fzf | awk '\''{print $1}'\'')'
alias yt="youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mkv"
alias ssd='sudo mount /dev/$(ls /dev | grep sd | fzf) /mnt/ssd/'
alias usb='sudo mount /dev/$(ls /dev | grep sd | fzf) /mnt/usb/'
alias remake="make && sudo make install && make clean"
alias upd="sudo pacman -Syu && rustup update && pipupgrade -i"
alias ins="sudo pacman -S"

# loading nnn config
source ~/.config/nnn/rc
stty -ixon

# including rust
export PATH="$HOME/.cargo/bin:$PATH"

# making makepkg multithreaded
export MAKEFLAGS="-j$(expr $(nproc) \+ 1)"
