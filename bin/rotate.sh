#! /bin/sh

#	8"""8
#	8   8  eeeee eeeee eeeee eeeee eeee
#	8eee8e 8  88   8   8   8   8   8
#	88   8 8   8   8e  8eee8   8e  8eee
#	88   8 8   8   88  88  8   88  88
#	88   8 8eee8   88  88  8   88  88ee


TEMP=$(xinput | grep "Finger" | awk '{print $8}' | cut -b 4-6)

if [ `xrandr | grep eDP | awk '{print $4}'` = "(normal" ]; then
    xrandr --output eDP1 --rotate left
    xinput set-prop $TEMP "Coordinate Transformation Matrix" 4 -1 1 1 0 0 0 0 1
    echo normal
else
    xrandr --output eDP1 --rotate normal
    xinput set-prop $TEMP "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
    echo not_normal
fi
