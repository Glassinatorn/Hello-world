#! /bin/sh

#    @@@  @@@  @@@@@@@@@@    @@@@@@
#    @@@  @@@  @@@@@@@@@@@  @@@@@@@
#    @@!  @@@  @@! @@! @@!  !@@
#    !@!  @!@  !@! !@! !@!  !@!
#    @!@  !@!  @!! !!@ @!@  !!@@!!
#    !@!  !!!  !@!   ! !@!   !!@!!!
#    :!:  !!:  !!:     !!:       !:!
#     ::!!:!   :!:     :!:      !:!
#      ::::    :::     ::   :::: ::
#       :       :      :    :: : :

# TODO: add more distros
#       rename variables to be descriptive
#       remove comments

# getting first choice from user
printf "Current: \n$(virsh  list --all)\n\n"

DEFAULT='n'
echo "New/Start/Delete [N/s/d]:" 
read CHOICE
CHOICE="${CHOICE:-${DEFAULT}}"


case $CHOICE in
'n') # creating new VM
    echo "Name: "
    read NAME

    # check if name is taken
    if [ -f /var/lib/libvirt/images/$NAME.* ]; then
        DEFAULT='Y'
        read -p "You already have one created, replace it? [Y/n]:" CHOICE
        CHOICE="${CHOICE:-${DEFAULT}}"

        if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
            # TODO: check if they exist
            virsh destroy $NAME
            virsh undefine $NAME --remove-all-storage
        fi
    fi

    # Storage size
    DEFAULT='15'
    read -p "Storage size? Default is 15 (GB): " SIZE
    SIZE="${SIZE:-${DEFAULT}}"

    # getting RAM size
    DEFAULT='2'
    read -p "RAM size? Default is 2 (GB): " MEMORY
    MEMORY="${MEMORY:-${DEFAULT}}"
    MEMORY=$(($MEMORY * 1024))

    # getting number of cores and threads
    read -p "Number of cores? Default is 2: " CORES
    CORES="${CORES:-${DEFAULT}}"
    THREADS=$(($CORES * 2))

    # getting network
    NETWORK=$(ls /etc/libvirt/qemu/networks/*.xml \
        | fzf \
        | cut -d "/" -f 6 \
        | sed 's/.xml//g')

    # getting storage format for the image
    FORMAT=$(printf "qcow2\nraw" \
        | fzf)

    # Choose operating system
    ISO=$(ls $HOME/Downloads \
            | grep iso \
            | fzf)

    OS_NAME=$(virt-install --osinfo list \
            | fzf \
            | cut -d ',' -f 2 \
            | sed 's/ //')

    # for arch
    if [ $OS_NAME = "archlinux" ]; then
        mkdir -p /tmp/libvirt
        isoinfo -i $HOME/Downloads/$ISO -x '/ARCH/BOOT/X86_64/VMLINUZ_LINUX.;1' > /tmp/libvirt/vmlinuz
        isoinfo -i $HOME/Downloads/$ISO -x '/ARCH/BOOT/X86_64/INITRAMFS_LINUX.IMG;1' > /tmp/libvirt/archiso.img

        ##virt-install --name=$NAME \
        ##--vcpus=2 \
        ##--memory=$MEMORY \
        ##--cdrom=$HOME/Downloads/$ISO \
        ##--location /tmp/libvirt,kernel=/tmp/libvirt/vmlinuz,initrd=/tmp/libvirt/archiso.img \
        ##--disk /var/lib/libvirt/images/$NAME,size=$SIZE \
        ##--hvm \
        ##--os-variant=$OS_NAME \
        ##--network bridge:virbr0 \
        ##--graphics none \
        ##--console pty,target_type=serial \
        ##--extra-args console=ttyS0,115200n8 serial \
        ##--check path_in_use=off

        tdir=/tmp/libvirt
        virt-install -n arch --memory=2048 \
          --location ${tdir},kernel=${tdir}/vmlinuz,initrd=${tdir}/archiso.img \
          --disk $HOME/Downloads/$ISO,device=cdrom --disk /var/lib/libvirt/images/$NAME,size=$SIZE --nographics \
          --network bridge:default \
          --os-variant=$OS_NAME \
          --check path_in_use=off \
          --install kernel_args='console=tty0 console=ttyS0,115200n8 serial archisodevice=/dev/sr0'

    else
        # TODO: chec if this is ever needed
        # creating vm
        virt-install --name testingthisshit \
        --vcpus=2 \
        --memory=$MEMORY \
        --cdrom=$HOME/Downloads/$ISO \
        --location=$HOME/Downloads/$ISO \
        --disk /var/lib/libvirt/images/$NAME,size=$SIZE \
        --hvm \
        --os-variant=$OS_NAME \
        --network bridge:virbr0 \
        --graphics none \
        --console pty,target_type=serial \
        --extra-args console=ttyS0,115200n8 serial \
        --check path_in_use=off
    fi


    # # booting live-iso
    # sudo qemu-system-x86_64 -enable-kvm -m 1024 \
        # -cdrom $HOME/Downloads/$ISO \
        # /var/lib/libvirt/images/$NAME.$FORMAT \
        # -nic user,hostfwd=tcp::10022-:22 &

    # checking and preparing cli distro
    # sleep 2
    # DEFAULT='Y'
    # read -p "Cli distro? [Y/n]:" CHOICE
    # CHOICE="${CHOICE:-${DEFAULT}}"

    # if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
    #     DISTRO=$(printf "arch\nmanjaro\nubuntu\ndebian\nkiss\nbsd" \
    #         | fzf)

    #     case $DISTRO in
    #         'arch') CMD_1=$ARCH_1; CMD_2=$ARCH_2 ;;
    #         'manjaro') CMD_1=$MANJARO_1; CMD_2=$MANJARO_2 ;;
    #         'ubuntu') CMD_1=$UBUNTU_1; CMD_2=$UBUNTU_2 ;;
    #         'debian') CMD_1=$DEBIAN_1; CMD_2=$DEBIAN_2 ;;
    #         'kiss') CMD_1=$KISS_1; CMD_2=$KISS_2 ;;
    #         'bsd') CMD_1=$BSD_1; CMD_2=$BSD_2 ;;
    #         *) printf "No premade commands for that one" ;;
    #     esac

    #     clear
    #     DEFAULT='Y'
    #     read -p "Ssh to VM? [Y/n]:" CHOICE
    #     CHOICE="${CHOICE:-${DEFAULT}}"

    #     if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
    #         TOKENS=$(cat .ssh/known_hosts | awk '{ if ($1 != "[localhost]:10022") print $0 }')
    #         printf "$TOKENS" >~/.ssh/known_hosts
    #         echo 'ssh root@localhost -p 10022' | xclip -selection c
    #         printf "SSH address sent to clipboard\n"
    #     fi

    #     read -p "Install-commands? [Y/n]:" CHOICE
    #     CHOICE="${CHOICE:-${DEFAULT}}"

    #     if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
    #         printf "$CMD_1" | xclip -selection c
    #     fi

    #     read -p "Chroot-commands? [Y/n]:" CHOICE
    #     CHOICE="${CHOICE:-${DEFAULT}}"

    #     if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
    #         printf "$CMD_2" | xclip -selection c
    #     fi
    # fi

    # # creating and defining the VM
    # sudo sed "s/<++><\/name>/$NAME<\/name>/g; \
    #           s/GiB\"><++>/GiB\">$MEMORY/g; \
    #           s/<++><\/vcpu>/$THREADS<\/vcpu>/g; \
    #           s/cores=\"<++>\"/cores=\"$CORES\"/g; \
    #           s/images\/<++>/images\/$NAME/g; \
    #           s/network=\"<++>\"/network=\"$NETWORK\"/g; \
    #           s/Downloads\/<++>/Downloads\/$ISO/g" \
    #     /etc/libvirt/qemu/default_linux.xml > $NAME.xml


    # read -p "Finish? [Y/n]:" CHOICE
    # CHOICE="${CHOICE:-${DEFAULT}}"

    if [ $CHOICE = 'Y' ] || [ $CHOICE = 'y' ]; then
        sudo virsh define $NAME.xml
        rm $NAME.xml
    fi
    ;;
's') # starting existing VM
    virsh start $(virsh list --all |
        awk '{
            if($2!="Name")
                print $2
            }' | fzf)
    ;;
'd') # deleting VM
    NAME=$(virsh list --all |
        awk '{
            if($2!="Name")
                print $2
            }' | fzf)
    # TODO: 
    # - check if they excist
    virsh destroy $NAME
    sudo rm /var/lib/libvirt/images/$NAME
    virsh undefine $NAME
    ;;
esac


## # defining commands for distros
## # arch commands
## ARCH_1='timedatectl set-ntp true;
##     cfdisk /dev/nvme0n1 && mkfs.ext4 /dev/nvme0n1p2 && mkfs.vfat /dev/nvme0n1p1;
##     mount /dev/nvme0n1p2 /mnt && mkdir /mnt/boot &&
##     mount /dev/nvme0n1p1 /mnt/boot;
##     pacstrap /mnt base linux linux-firmware networkmanager openssh \
##     neovim vi man-db man-pages texinfo zsh sudo refind os-prober rsync fzf;
##     genfstab -U /mnt >> /mnt/etc/fstab;
##     arch-chroot /mnt;'
## ARCH_2='ln -sf /usr/share/zoneinfo/Europe/Stockholm /etc/localtime;
##     hwclock --systohc;
##     sed -i "/en_GB.UTF-8 UTF-8/s/^#//g" /etc/locale.gen;
##     printf "LANG=en_GB.UTF-8" > /etc/locale.conf;
##     locale-gen;
##     printf "archbox" > /etc/hostname;
##     printf "127.0.0.1 \tlocalhost \n::1 \t \t localhost \n127.0.1.1 \t $HOSTNAME.localdomain \t $HOSTNAME" > /etc/hosts;
##     mkinitcpio -P;
##     useradd -m -G wheel -s /usr/bin/zsh glass;
##     visudo;
##     passwd glass;
##     passwd root;
##     systemctl enable sshd;
##     systemctl enable NetworkManager;
##     refind-install;
##     mkdir -p /home/backup/;
##     chown -R glass /home/backup;'
##     printf "\"Boot with standard options\"\t\"ro root=/sda2\"\n\"Boot to single-user mode\"\t\"ro root=/dev/sda2\"\n\"Boot with minimal options\"\t\"ro root=/dev/sda2\"" > /boot/refind_linux.conf
##     #grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=GRUB
##     #grub-install /dev/nvme0n1;
##     #grub-mkconfig -o /boot/grub/grub.cfg;
##     #mkdir -p /home/backup/;
##     #chown -R glass /home/backup;'
## 
##     # TODO: check so the visudo command works []
##     #       fix standard settings for refind in /boot/EFI/refind_linux.conf
## 
## # debian commands
## 
## # ubuntu commands
## 
## # kiss commands
## 
## # bsd commands
## 
## 
## # getting first choice from user
## printf "Current: \n$(sudo virsh  list --all)\n\n"
## 
## DEFAULT='n'
## echo "New/Start/Delete [N/s/d]:" 
## read CHOICE
## CHOICE="${CHOICE:-${DEFAULT}}"
## 
## case $CHOICE in
## 'n') # creating new VM
##     echo "Name: "
##     read NAME
## 
##     # check if name is taken
##     if [ -f /var/lib/libvirt/images/$NAME.* ]; then
##         DEFAULT='Y'
##         read -p "You already have one created, replace it? [Y/n]:" CHOICE
##         CHOICE="${CHOICE:-${DEFAULT}}"
## 
##         if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
##             sudo virsh destroy $NAME
##             sudo rm /var/lib/libvirt/images/$NAME.*
##             sudo virsh undefine $NAME
##         fi
##     fi
## 
##     # getting storage size
##     DEFAULT='15'
##     read -p "Storage size? Default is 15 (GB): " SIZE
##     SIZE="${SIZE:-${DEFAULT}}"
## 
##     # getting RAM size
##     DEFAULT='2'
##     read -p "RAM size? Default is 2 (GB): " MEMORY
##     MEMORY="${MEMORY:-${DEFAULT}}"
## 
##     # getting number of cores and threads
##     read -p "Number of cores? Default is 2: " CORES
##     CORES="${CORES:-${DEFAULT}}"
##     THREADS=$(($CORES * 2))
## 
##     # getting network
##     NETWORK=$(ls /etc/libvirt/qemu/networks/*.xml \
##         | fzf \
##         | cut -d "/" -f 6 \
##         | sed 's/.xml//g')
## 
##     # getting storage format for the image
##     FORMAT=$(printf "qcow2\nraw" \
##         | fzf)
## 
##     # getting ISO
##     ISO=$(ls $HOME/Downloads \
##         | grep iso \
##         | fzf)
## 
##     # creating image
##     sudo qemu-img create -f $FORMAT /var/lib/libvirt/images/$NAME.$FORMAT \
##         $SIZE"G" &
## 
##     # booting live-iso
##     sudo qemu-system-x86_64 -enable-kvm -m 1024 \
##         -cdrom $HOME/Downloads/$ISO \
##         /var/lib/libvirt/images/$NAME.$FORMAT \
##         -nic user,hostfwd=tcp::10022-:22 &
## 
##     # checking and preparing cli distro
##     sleep 2
##     DEFAULT='Y'
##     read -p "Cli distro? [Y/n]:" CHOICE
##     CHOICE="${CHOICE:-${DEFAULT}}"
## 
##     if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
##         DISTRO=$(printf "arch\nmanjaro\nubuntu\ndebian\nkiss\nbsd" \
##             | fzf)
## 
##         case $DISTRO in
##             'arch') CMD_1=$ARCH_1; CMD_2=$ARCH_2 ;;
##             'manjaro') CMD_1=$MANJARO_1; CMD_2=$MANJARO_2 ;;
##             'ubuntu') CMD_1=$UBUNTU_1; CMD_2=$UBUNTU_2 ;;
##             'debian') CMD_1=$DEBIAN_1; CMD_2=$DEBIAN_2 ;;
##             'kiss') CMD_1=$KISS_1; CMD_2=$KISS_2 ;;
##             'bsd') CMD_1=$BSD_1; CMD_2=$BSD_2 ;;
##             *) printf "No premade commands for that one" ;;
##         esac
## 
##         clear
##         DEFAULT='Y'
##         read -p "Ssh to VM? [Y/n]:" CHOICE
##         CHOICE="${CHOICE:-${DEFAULT}}"
## 
##         if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
##             TOKENS=$(cat .ssh/known_hosts | awk '{ if ($1 != "[localhost]:10022") print $0 }')
##             printf "$TOKENS" >~/.ssh/known_hosts
##             echo 'ssh root@localhost -p 10022' | xclip -selection c
##             printf "SSH address sent to clipboard\n"
##         fi
## 
##         read -p "Install-commands? [Y/n]:" CHOICE
##         CHOICE="${CHOICE:-${DEFAULT}}"
## 
##         if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
##             printf "$CMD_1" | xclip -selection c
##         fi
## 
##         read -p "Chroot-commands? [Y/n]:" CHOICE
##         CHOICE="${CHOICE:-${DEFAULT}}"
## 
##         if [ $CHOICE = 'y' ] || [ $CHOICE = 'Y' ]; then
##             printf "$CMD_2" | xclip -selection c
##         fi
##     fi
## 
##     # creating and defining the VM
##     sudo sed "s/<++><\/name>/$NAME<\/name>/g; \
##               s/GiB\"><++>/GiB\">$MEMORY/g; \
##               s/<++><\/vcpu>/$THREADS<\/vcpu>/g; \
##               s/cores=\"<++>\"/cores=\"$CORES\"/g; \
##               s/images\/<++>/images\/$NAME/g; \
##               s/network=\"<++>\"/network=\"$NETWORK\"/g; \
##               s/Downloads\/<++>/Downloads\/$ISO/g" \
##         /etc/libvirt/qemu/default_linux.xml > $NAME.xml
## 
## 
##     read -p "Finish? [Y/n]:" CHOICE
##     CHOICE="${CHOICE:-${DEFAULT}}"
## 
##     if [ $CHOICE = 'Y' ] || [ $CHOICE = 'y' ]; then
##         sudo virsh define $NAME.xml
##         rm $NAME.xml
##     fi
##     ;;
## 's') # starting existing VM
##     sudo virsh start $(sudo virsh list --all |
##         awk '{
##             if($2!="Name")
##                 print $2
##             }' | fzf)
##     ;;
## 'd') # deleting VM
##     NAME=$(sudo virsh list --all |
##         awk '{
##             if($2!="Name")
##                 print $2
##             }' | fzf)
##     sudo virsh destroy $NAME
##     sudo rm /var/lib/libvirt/images/$NAME.*
##     sudo virsh undefine $NAME
##     ;;
## esac
