#! /bin/sh


#   @@@@@@    @@@@@@@  @@@@@@@   @@@@@@@@  @@@@@@@@  @@@  @@@   @@@@@@  @@@  @@@   @@@@@@   @@@@@@@
#  @@@@@@@   @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@ @@@  @@@@@@@  @@@  @@@  @@@@@@@@  @@@@@@@
#  !@@       !@@       @@!  @@@  @@!       @@!       @@!@!@@@  !@@      @@!  @@@  @@!  @@@    @@!
#  !@!       !@!       !@!  @!@  !@!       !@!       !@!!@!@!  !@!      !@!  @!@  !@!  @!@    !@!
#  !!@@!!    !@!       @!@!!@!   @!!!:!    @!!!:!    @!@ !!@!  !!@@!!   @!@!@!@!  @!@  !@!    @!!
#   !!@!!!   !!!       !!@!@!    !!!!!:    !!!!!:    !@!  !!!   !!@!!!  !!!@!!!!  !@!  !!!    !!!
#       !:!  :!!       !!: :!!   !!:       !!:       !!:  !!!       !:! !!:  !!!  !!:  !!!    !!:
#      !:!   :!:       :!:  !:!  :!:       :!:       :!:  !:!      !:!  :!:  !:!  :!:  !:!    :!:
#  :::: ::    ::: :::  ::   :::   :: ::::   :: ::::   ::   ::  :::: ::  ::   :::  ::::: ::     ::
#  :: : :     :: :: :   :   : :  : :: ::   : :: ::   ::    :   :: : :    :   : :   : :  :      :


curr_time=$(date +%F_%H:%M:%S".png")
notify-send "Screenshot" "Select an area to screenshot"

if [ $# -eq 1 ]; then
    maim -s "$1"
    echo "$1" | xclip -selection c
    notify-send "Screenshot" "Screenshot saved to $1"
else
    curr_time=$(date +%F_%H:%M:%S".png")
    maim -s ~/screenshots/$curr_time && \
    echo "$HOME/screenshots/$curr_time" | xclip -selection c
    notify-send "Screenshot" "Screenshot saved to ~/screenshots/$curr_time"
fi
