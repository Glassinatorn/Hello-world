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
export LIBVA_DRIVER_NAME=iHD

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
alias ddjango="docker run -d -p 8000:8000 --name django_app -v /tmp/django:/usr/src/app django"
alias dkali="docker run -it --name pentest-container kalilinux/kali-rolling"

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
alias pup="sudo pacman -Syu && \
    printf \"General system done!\n\n\n\"
    rustup update && \
    printf \"\n\nRust done!\n\n\n\" \
    pipup && \
    printf \"\n\nPython done!\n\n\n\" \
    nvim -c ':PackerSync' \
    nvim -c ':TSUpdate' \
    printf \"\n\nNvim done!\n\n\n\""
alias pin="sudo pacman -S"
alias prm='sudo pacman -R $( \
    pacman -Q \
        | fzf -m \
        | awk '\''{ \
            print $1 \
            }'\'')'
alias n="nnn"
alias py="python"
alias pe="if [ -d env/ ]; then
        source env/bin/activate
    else
        printf 'Creating a new enviroment\n'
        python3 -m venv env
        source env/bin/activate
        pip install pynvim
        touch requirement.txt
    fi"
alias luadev="luarocks init && echo '{ 
    \"workspace.library\": [\"$PWD/lua_modules\"],
    \"runtime.version\": \"Lua 5.4\",
    \"hint.enable\": true
}' >> .luarc.json && 
    luarocks install --tree lua_modules debugger &&
    luarocks install --tree lua_modules dump &&
    echo \"package.path = package.path .. ';$PWD/lua_modules/share/lua/5.4/?.lua;/usr/share/lua/5.4/?.lua'
local debugger = require('"'debugger'"')
debugger()\" >> main.lua"
alias pipup="pip3 list --outdated --format=freeze 
    | grep -v '^\-e' 
    | cut -d = -f 1 
    | xargs -n1 pip3 install -U"
alias gwall="xwinwrap -g 240x240+839+297 -ov -sh circle -- gifview -w WID -a"
alias proto="ls *.proto \
    | fzf \
    | xargs python -m grpc_tools.protoc -I. \--python_out=. --grpc_python_out=. \
    $1"
alias overleaf="mkdir overleaf &&
    touch overleaf/report.tex;
    cat report.tex |
        sed 's/pictures\/screenshots\///g' >> overleaf/report.tex;
    cp pictures/screenshots/* overleaf/;"
alias rmt="rm *.aux *.bbl *.blg *.fls *.log *.out *.fdb_latexmk *synctex.gz"
alias bww="bitwarden_wrapper.sh"
alias r2="r2 -AAA"
alias sc="sc-im"
alias f="find 2>/dev/null / -name"

# loading nnn config
source ~/.config/nnn/rc
stty -ixon

# including rust
export PATH="$HOME/.cargo/bin:$PATH"

# making makepkg multithreaded
export MAKEFLAGS="-j$(expr $(nproc) \+ 1)"

# making java apps viewable
export _JAVA_AWT_WM_NONREPARENTING=1

# settings for android development with flutter
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export ANDROID_SDK_ROOT='/opt/android-sdk'
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable

# sourcing secrets
source ~/.secrets
