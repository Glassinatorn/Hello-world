#! /bin/sh

#	     8""""8 8""""8 8   8
#	eeee 8    " 8    8 8   8
#	8    8e     8eeee8 8e  8
#	8eee 88  ee 88     88  8
#	88   88   8 88     88  8
#	88ee 88eee8 88     88ee8


DIR="/etc/X11/xorg.conf.d"

if [ `ls $DIR/ | grep 20` == "20-nvidia.conf" ];
then
    sudo mv $DIR/../20-intel.conf $DIR/ && \
    sudo mv $DIR/20-nvidia.conf $DIR/../20-nvidia.conf
else
    sudo modprobe -r nvidia-drm
    sudo modprobe nvidia-drm
    sudo mv $DIR/../20-nvidia.conf $DIR/ && \
    sudo mv $DIR/20-intel.conf $DIR/../20-intel.conf
fi

sudo systemctl restart lightdm
