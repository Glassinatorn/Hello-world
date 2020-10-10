#! /bin/sh

#     @@@@@@@@  @@@  @@@@@@@  @@@  @@@  @@@@@@@
#    @@@@@@@@@  @@@  @@@@@@@  @@@  @@@  @@@@@@@@
#    !@@        @@!    @@!    @@!  @@@  @@!  @@@
#    !@!        !@!    !@!    !@!  @!@  !@!  @!@
#    !@! @!@!@  !!@    @!!    @!@  !@!  @!@@!@!
#    !!! !!@!!  !!!    !!!    !@!  !!!  !!@!!!
#    :!!   !!:  !!:    !!:    !!:  !!!  !!:
#    :!:   !::  :!:    :!:    :!:  !:!  :!:
#     ::: ::::   ::     ::    ::::: ::   ::
#     :: :: :   :       :      : :  :    :

# defining paths
CD="$HOME/.config"
BID="$HOME/.local/bin/own"
SHD="$HOME/.local/share"
ND="/usr/share/nvim/runtime"
BD="$HOME/freetime/code/various/Hello-world"
SD="$HOME/freetime/code/c/git/suckless"
CMD="sudo rsync -razzP --del"

# various from .config
$CMD $CD/i3 \
    $CD/bspwm \
    $CD/awesome \
    $CD/sxhkd \
    $CD/gtk-3.0 \
    $CD/polybar \
    $CD/termite \
    $CD/picom.conf \
    $CD/gtk-3.0 \
    $BD/config/

# nnn
$CMD $CD/nnn/plugins \
    $CD/nnn/rc \
    $BD/config/nnn/

# qutebrowser
$CMD $CD/qutebrowser/config.py \
    $BD/config/qutebrowser/

# tmux
$CMD /etc/tmux.conf \
    $BD/etc/

# zsh
$CMD $HOME/.zshrc \
    $BD/zshrc

# profiles
$CMD $HOME/.xprofile \
    $BD/xprofile
$CMD $HOME/.profile \
    $BD/profile

# xorg
$CMD /etc/X11/xorg.conf.d/20-* \
    /etc/X11/20-* \
    $BD/etc/X11/

# own scripts
$CMD $BID/fix \
    $BID/egpu.sh \
    $BID/gitUp.sh \
    $BID/sysinfo \
    $BID/shutdown.sh \
    $BID/keymap \
    $BID/qutebrowser_session \
    $BID/shutdown.sh \
    $BID/brightness \
    $BID/rotate.sh \
    $BD/bin/

# suckless
$CMD --exclude '.git' $SD/dmenu \
    $BD/suckless/
$CMD --exclude '.git' $SD/dwm \
    $BD/suckless/
$CMD --exclude '.git' $SD/st \
    $BD/suckless/

# nvim
$CMD $CD/nvim/init.vim \
    $CD/nvim/coc-settings.json \
    $BD/nvim/
$CMD $CD/nvim/after/ \
    $BD/nvim/after/

$CMD $ND/plugin/map_* $BD/nvim/plugin/
$CMD $ND/colors/mono_tl.vim* $BD/nvim/colors/
$CMD $ND/skeletons/* $BD/nvim/skeletons/
$CMD $ND/doc/doc.txt \
    $ND/doc/doc_* \
    $BD/nvim/doc/

# navi
$CMD $SHD/navi/cheats/own/ $BD/navi/cheats/own/


# uploading to github
DEFAULT='Y'
read -p "Upload [Y/n]: " CHOICE
CHOICE="${CHOICE:-${DEFAULT}}"

printf "$CHOICE"

if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
    cd $BD
    git add *
    git commit
    git push
fi
