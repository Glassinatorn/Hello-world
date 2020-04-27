#! /bin/sh

#	8""""8
#	8    " e eeeee
#	8e     8   8
#	88  ee 8e  8e
#	88   8 88  88
#	88eee8 88  88

USR="/home/$(whoami)"
CONFDIR="$USR/.config"
BINDIR="$USR/bin"
NVIMRUNTIME="/usr/share/nvim/runtime"
BACKUPFOLDER="$USR/backup/Hello-world"
SUCKLESS="$USR/freetime/code/c/git/suckless"
CMD="sudo rsync -razzP --del"

# .config
$CMD $CONFDIR/i3 \
     $CONFDIR/bspwm \
     $CONFDIR/awesome \
     $CONFDIR/sxhkd \
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
$CMD $USR/.zshrc                        $BACKUPFOLDER/zshrc

# profiles
$CMD $USR/.xprofile                     $BACKUPFOLDER/xprofile
$CMD $USR/.profile                      $BACKUPFOLDER/profile

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
     $BINDIR/rotate.sh                  $BACKUPFOLDER/bin/

# suckless
$CMD --exclude '.git' $SUCKLESS/dmenu   $BACKUPFOLDER/suckless/
$CMD --exclude '.git' $SUCKLESS/dwm     $BACKUPFOLDER/suckless/
$CMD --exclude '.git' $SUCKLESS/st      $BACKUPFOLDER/suckless/

# nvim
$CMD $CONFDIR/nvim/init.vim \
     $CONFDIR/nvim/coc-settings.json    $BACKUPFOLDER/nvim/

$CMD $NVIMRUNTIME/plugin/map_*          $BACKUPFOLDER/nvim/plugin/
$CMD $NVIMRUNTIME/colors/mono_tl.vim*   $BACKUPFOLDER/nvim/colors/
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
