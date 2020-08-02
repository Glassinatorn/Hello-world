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


CONFDIR="$HOME/.config"
BINDIR="$HOME/.local/bin/own"
NVIMRUNTIME="/usr/share/nvim/runtime"
BACKUPFOLDER="$HOME/freetime/code/various/Hello-world"
SUCKLESS="$HOME/freetime/code/c/git/suckless"
CMD="sudo rsync -razzP --del"

# .config
$CMD $CONFDIR/i3 \
     $CONFDIR/bspwm \
     $CONFDIR/awesome \
     $CONFDIR/sxhkd \
     $CONFDIR/gtk-3.0 \
     $CONFDIR/polybar \
     $CONFDIR/termite \
     $CONFDIR/picom.conf	        $BACKUPFOLDER/config/

# nnn
$CMD $CONFDIR/nnn/plugins \
     $CONFDIR/nnn/rc                    $BACKUPFOLDER/config/nnn/

# qutebrowser
$CMD $CONFDIR/qutebrowser/config.py     $BACKUPFOLDER/config/qutebrowser/

# tmux
$CMD /etc/tmux.conf                     $BACKUPFOLDER/etc/

# zsh
$CMD $HOME/.zshrc                        $BACKUPFOLDER/zshrc

# profiles
$CMD $HOME/.xprofile                     $BACKUPFOLDER/xprofile
$CMD $HOME/.profile                      $BACKUPFOLDER/profile

# xorg
$CMD /etc/X11/xorg.conf.d/20-* \
     /etc/X11/20-*                      $BACKUPFOLDER/etc/X11/

# bin
$CMD $BINDIR/fix \
     $BINDIR/egpu.sh \
     $BINDIR/gitUp.sh \
     $BINDIR/sysinfo \
     $BINDIR/shutdown.sh \
     $BINDIR/keymap \
     $BINDIR/qutebrowser_session \
     $BINDIR/shutdown.sh \
     $BINDIR/brightness \
     $BINDIR/rotate.sh                  $BACKUPFOLDER/bin/

# suckless
$CMD --exclude '.git' $SUCKLESS/dmenu   $BACKUPFOLDER/suckless/
$CMD --exclude '.git' $SUCKLESS/dwm     $BACKUPFOLDER/suckless/
$CMD --exclude '.git' $SUCKLESS/st      $BACKUPFOLDER/suckless/

# nvim
$CMD $CONFDIR/nvim/init.vim \
     $CONFDIR/nvim/coc-settings.json    $BACKUPFOLDER/nvim/
$CMD $CONFDIR/nvim/after/coc.vim        $BACKUPFOLDER/nvim/after/

$CMD $NVIMRUNTIME/plugin/map_*          $BACKUPFOLDER/nvim/plugin/
$CMD $NVIMRUNTIME/colors/mono_tl.vim*   $BACKUPFOLDER/nvim/colors/
$CMD $NVIMRUNTIME/skeletons/*           $BACKUPFOLDER/nvim/skeletons/
$CMD $NVIMRUNTIME/doc/doc.txt \
     $NVIMRUNTIME/doc/doc_*             $BACKUPFOLDER/nvim/doc/

echo "upload? y?"
read UPLOAD

if [ $UPLOAD = 'y' ]
then
    cd $BACKUPFOLDER
    git add *
    git commit
    git push
fi
