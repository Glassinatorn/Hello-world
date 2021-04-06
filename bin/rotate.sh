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
    | grep "IPTS Touch" \
    | awk '{print $5}' \
    | cut -b 4-6)

# checking screen orientation
SCREEN=$(xrandr \
    | grep eDP \
    | awk '{print $1}')

#
ROTATED=$(xrandr \
    | grep eDP \
    | awk '{print $5}')

# rotating screen
if [ $ROTATED = '(normal' ]; then
    xrandr --output $SCREEN --rotate left
    xinput set-prop $TOUCH_DEV "Coordinate Transformation Matrix" 4 -1 1 1 0 0 0 0 1
    echo "normal"
else
    xrandr --output $SCREEN --rotate normal
    xinput set-prop $TOUCH_DEV "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
    echo "not_normal"
fi
