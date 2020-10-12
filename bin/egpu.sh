#! /bin/sh


#    @@@@@@@@   @@@@@@@@  @@@@@@@   @@@  @@@
#    @@@@@@@@  @@@@@@@@@  @@@@@@@@  @@@  @@@
#    @@!       !@@        @@!  @@@  @@!  @@@
#    !@!       !@!        !@!  @!@  !@!  @!@
#    @!!!:!    !@! @!@!@  @!@@!@!   @!@  !@!
#    !!!!!:    !!! !!@!!  !!@!!!    !@!  !!!
#    !!:       :!!   !!:  !!:       !!:  !!!
#    :!:       :!:   !::  :!:       :!:  !:!
#     :: ::::   ::: ::::   ::       ::::: ::
#    : :: ::    :: :: :    :         : :  :


DIR="/etc/X11/xorg.conf.d"

# switching AMD and intel as display driver
# if [ -e $DIR/20-radeon.conf ]; then
#     sudo mv $DIR/../20-intel.conf $DIR/ && \
#     sudo mv $DIR/20-radeon.conf $DIR/../20-nvidia.conf
# else
#     sudo mv $DIR/../20-radeon.conf $DIR/ && \
#     sudo mv $DIR/20-intel.conf $DIR/../20-intel.conf
# fi


# switching nvidia and intel as display driver
if [ -e $DIR/20-nvidia.conf ]; then
    sudo mv $DIR/../20-intel.conf $DIR/ && \
    sudo mv $DIR/20-nvidia.conf $DIR/../20-nvidia.conf
else
    sudo modprobe -r nvidia-drm
    sudo modprobe nvidia-drm
    sudo mv $DIR/../20-nvidia.conf $DIR/ && \
    sudo mv $DIR/20-intel.conf $DIR/../20-intel.conf
fi

# restarting display manager
sudo systemctl restart lightdm
