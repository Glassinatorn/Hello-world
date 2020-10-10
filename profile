#! /bin/sh

# colors in less
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/bin/own"
export EDITOR=nvim

# setting prompt
PS1='>_ '

# git
alias gu="git fetch && git pull"
alias gs="git status"
alias ga='git add $(git status \
    | awk '\''{ \
        if ($1 == "modified:" || $1 == "new:") \
            print $2\
        }'\'' \
    | uniq \
    | fzf -m)'
alias gr="git rm"
alias gc="git commit"
alias gp="git push"
alias gb='CHOICE=$( \
    printf "$(git branch)\n  NEW\n  DELETE" \
        | fzf \
        | cut -d " " -f 3)
    case $CHOICE in
        "NEW")
            printf "New branch: "
            read CHOICE
            git branch $CHOICE && git checkout $CHOICE
            ;;
        "DELETE")
            git branch -d $(git branch | fzf)
            ;;
        *)
            git checkout $CHOICE
            ;;
    esac'

# docker
alias dl="docker ps -a"
alias di="docker images"
alias ds='docker stop $(
    docker inspect $( \
        docker ps -aq) --format='\''{{.Name}}'\'' \
            | sed s/'\''\/'\''//g \
            | fzf)'
alias drm='docker rm $( \
    docker inspect $( \
        docker ps -aq) --format='\''{{.Name}}'\'' \
            | sed s/'\''\/'\''//g \
            | fzf)'
alias dd="docker-compose down -v"
alias du="docker-compose up -d"
alias db="docker-compose build"
alias dr="dd && db && du"

# cargo
alias cr="clear && cargo run"
alias ct="clear && cargo test"
alias cn="cargo new --vcs git"

# nvim
alias v="nvim"
alias sv="sudo nvim"
alias vs='sudo nvim $( \
    ls /usr/share/nvim/runtime/skeletons/skeleton* \
        | fzf)'
alias vm='sudo nvim $( \
    ls /usr/share/nvim/runtime/plugin/map_* \
        | fzf)'
alias vd='sudo nvim $( \
    ls /usr/share/nvim/runtime/doc/doc* \
        | fzf)'
alias vb='nvim ~/.local/bin/own/$( \
    ls ~/.local/bin/own/ \
        | fzf)'

# dir management
alias ls="ls --color=auto"
alias la="ls -lah"
alias ..="cd .."

# service management
alias se="sudo systemctl enable"
alias sr='sudo systemctl restart $( \
    systemctl list-units \
        | fzf -m)'
alias sS='sudo systemctl start $( \
    systemctl list-units -all \
        | fzf -m)'
alias ss='systemctl status $( \
    systemctl list-units \
        | fzf -m)'
alias murder='kill $( \
    ps -e \
        | fzf \
        | awk '\''{print $1}'\'')'

# various
alias tm='tmux a -t $( \
    tmux ls \
        | awk '\''{print $1}'\'' \
        | sed s/://g \
        | fzf)'
alias yt="youtube-dl -f \
    'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' \
    --merge-output-format mkv"
alias ssd='sudo mount /dev/$( \
    ls /dev \
        | grep sd \
        | fzf) /mnt/ssd/'
alias usb='sudo mount /dev/$( \
    ls /dev \
        | grep sd \
        | fzf) /mnt/usb/'
alias remake="make && sudo make install && make clean"
alias pup="sudo pacman -Syu && rustup update && pipupgrade -i"
alias pin="sudo pacman -S"
alias prm='sudo pacman -R $( \
    pacman -Q \
        | fzf -m \
        | awk '\''{ \
            print $1 \
            }'\'')'
alias n="nnn"
alias py="python3"
alias gwall="xwinwrap -g 240x240+839+297 -ov -sh circle -- gifview -w WID -a"
alias proto="ls *.proto \
    | fzf \
    | xargs python -m grpc_tools.protoc -I. \--python_out=. --grpc_python_out=. \
    $1"

# loading nnn config
source ~/.config/nnn/rc
stty -ixon

# including rust
export PATH="$HOME/.cargo/bin:$PATH"

# making makepkg multithreaded
export MAKEFLAGS="-j$(expr $(nproc) \+ 1)"

# making java apps viewable
export _JAVA_AWT_WM_NONREPARENTING=1
