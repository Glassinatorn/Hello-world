#! /bin/sh


#    @@@@@@@   @@@@@@@@   @@@@@@@   @@@@@@   @@@@@@@   @@@@@@@
#    @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@
#    @@!  @@@  @@!       !@@       @@!  @@@  @@!  @@@  @@!  @@@
#    !@!  @!@  !@!       !@!       !@!  @!@  !@!  @!@  !@!  @!@
#    @!@!!@!   @!!!:!    !@!       @!@  !@!  @!@!!@!   @!@  !@!
#    !!@!@!    !!!!!:    !!!       !@!  !!!  !!@!@!    !@!  !!!
#    !!: :!!   !!:       :!!       !!:  !!!  !!: :!!   !!:  !!!
#    :!:  !:!  :!:       :!:       :!:  !:!  :!:  !:!  :!:  !:!
#    ::   :::   :: ::::   ::: :::  ::::: ::  ::   :::   :::: ::
#     :   : :  : :: ::    :: :: :   : :  :    :   : :  :: :  :


# getting input for audio and video
AUDIO_INPUT=$(pactl list sources \
    | grep Name: \
    | awk '{ print $2 }' \
    | fzf)

# Ask if screen or not
DEFAULT='Y'
read -p "Screen? [Y/n]: " CHOICE
VIDEO="${CHOICE:-${DEFAULT}}"

# recording screen/audio
if [ $VIDEO = "y" ] || [ $VIDEO = "Y" ]; then
    # getting the screen to record
    MONITOR=$(xrandr \
        | grep -i connected \
        | sed s/primary//g \
        | awk '{ \
        if ($3 != "(normal") \
                print $1 " " $3 \
            }' \
        | fzf)

    # getting the position of the recording
    POS=$(printf "$MONITOR" \
        | awk '{ print $2 }' \
        | cut -d '+' -f 2-3 \
        | sed s/+/,/)

    # getting the size of the window to record
    RES=$(printf "$MONITOR" \
        | awk '{ print $2 }' \
        | cut -d '+' -f 1)

    # recording
    ffmpeg -f pulse -ac 2 -ar 44100 \
        -i $AUDIO_INPUT \
        -f x11grab -video_size $RES \
        -i :0.0+$POS output.mp4
else
    # recording
    ffmpeg -f pulse -ac 2 -ar 44100 \
        -i $AUDIO_INPUT  out.mp3
fi
