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
CMD="sudo rsync -razzP"

# .config
$CMD $CONFDIR/i3 \
     $CONFDIR/bspwm \
     $CONFDIR/awesome \
     $CONFDIR/sxhkd \
     $CONFDIR/polybar \
     $CONFDIR/termite \
     $CONFDIR/gtk-3.0/ \
     $CONFDIR/compton.conf	        $BACKUPFOLDER/config/

# nnn
$CMD $CONFDIR/nnn/plugins \
     $CONFDIR/nnn/rc                    $BACKUPFOLDER/config/nnn/

# qutebrowser
$CMD $CONFDIR/qutebrowser/config.py     $BACKUPFOLDER/config/qutebrowser/

# tmux
$CMD /etc/tmux.conf                     $BACKUPFOLDER/etc/

# zsh
$CMD $USR/.zshrc                        $BACKUPFOLDER/zshrc

# xprofile
$CMD $USR/.xprofile                     $BACKUPFOLDER/xprofile

# xorg
$CMD /etc/X11/xorg.conf.d/20-* \
     /etc/X11/20-*                      $BACKUPFOLDER/etc/X11/

# bin
$CMD $BINDIR/fix \
     $BINDIR/tmx.sh \
     $BINDIR/egpu.sh \
     $BINDIR/gitUp.sh \
     $BINDIR/sysinfo.sh \
     $BINDIR/sysinfo \
     $BINDIR/shutdown.sh \
     $BINDIR/dmenu_center \
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
