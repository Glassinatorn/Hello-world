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
# getting id for finger
# TODO: make awk print the second line
FINGER=$(xinput \
    | grep "IPTS Touch" \
    | awk '{print $5}' \
    | cut -b 4-6)

# getting id for pen
PEN=$(xinput \
    | grep "IPTS Stylus Pen" \
    | awk '{print $7}' \
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
    xrandr --output $SCREEN --rotate right
    xinput set-prop $FINGER "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
    xinput set-prop $PEN "Coordinate Transformation Matrix" 0 1 0 -1 0 1 0 0 1
    echo "normal"
else
    xrandr --output $SCREEN --rotate normal
    xinput set-prop $FINGER "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
    xinput set-prop $PEN "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
    echo "not_normal"
fi
