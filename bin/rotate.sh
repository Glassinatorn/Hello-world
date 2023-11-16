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

FINGER=$(xinput \
    | grep "Finger" \
    | awk '{print $7}' \
    | cut -b 4-6)

# getting id for pen
PEN=$(xinput \
    | grep "Pen Pen" \
    | awk '{print $9}' \
    | cut -b 4-6)

# checking screen orientation
SCREEN=$(xrandr \
    | grep eDP \
    | awk '{print $1}')

# the screen rotation
ROTATED=$(xrandr \
    | grep eDP \
    | awk '{print $5}')

# normal rotation matrix
normal_rotation='1 0 0 0 1 0 0 0 1'

# left rotation matrix 
left_rotation='0 -1 1 1 0 0 0 0 1'

# right rotation matrix
right_rotation='0 1 0 -1 0 1 0 0 1'

# rotating screen
if [ $ROTATED = '(normal' ]; then
    xrandr --output $SCREEN --rotate left
    xinput set-prop $FINGER "Coordinate Transformation Matrix" $left_rotation
    xinput set-prop $PEN "Coordinate Transformation Matrix" $left_rotation
else
    xrandr --output $SCREEN --rotate normal
    xinput set-prop $FINGER "Coordinate Transformation Matrix" $normal_rotation
    xinput set-prop $PEN "Coordinate Transformation Matrix" $normal_rotation
fi
