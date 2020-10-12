#! /bin/sh


#    @@@@@@@    @@@@@@   @@@@@@@   @@@@@@   @@@@@@@  @@@@@@@@
#    @@@@@@@@  @@@@@@@@  @@@@@@@  @@@@@@@@  @@@@@@@  @@@@@@@@
#    @@!  @@@  @@!  @@@    @@!    @@!  @@@    @@!    @@!
#    !@!  @!@  !@!  @!@    !@!    !@!  @!@    !@!    !@!
#    @!@!!@!   @!@  !@!    @!!    @!@!@!@!    @!!    @!!!:!
#    !!@!@!    !@!  !!!    !!!    !!!@!!!!    !!!    !!!!!:
#    !!: :!!   !!:  !!!    !!:    !!:  !!!    !!:    !!:
#    :!:  !:!  :!:  !:!    :!:    :!:  !:!    :!:    :!:
#    ::   :::  ::::: ::     ::    ::   :::     ::     :: ::::
#     :   : :   : :  :      :      :   : :     :     : :: ::

# getting hardware info
# getting id for touch device
TOUCH_DEV=$(xinput \
    | grep "Finger" \
    | awk '{print $7}' \
    | cut -b 4-6)

# checking screen orientation
SCREEN=$(xrandr \
    | grep eDP \
    | awk '{print $4}')

# rotating screen
if [ $SCREEN = '(normal' ]; then
    xrandr --output eDP1 --rotate left
    xinput set-prop $TEMP "Coordinate Transformation Matrix" 4 -1 1 1 0 0 0 0 1
    echo normal
else
    xrandr --output eDP1 --rotate normal
    xinput set-prop $TEMP "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
    echo not_normal
fi
