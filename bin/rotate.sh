#! /bin/sh

#	8"""8
#	8   8  eeeee eeeee eeeee eeeee eeee
#	8eee8e 8  88   8   8   8   8   8
#	88   8 8   8   8e  8eee8   8e  8eee
#	88   8 8   8   88  88  8   88  88
#	88   8 8eee8   88  88  8   88  88ee


temp=`xinput | grep Finger | cut -d "=" -f 2 | cut -b 1-2`

if [ `xrandr | grep eDP | awk '{print $5}'` == "(normal" ]; then
		xrandr --output eDP1 --rotate left
		xinput set-prop $temp "Coordinate Transformation Matrix" 0 -1 1 1 0 0 0 0 1
else
		xrandr --output eDP1 --rotate normal
		xinput set-prop $temp "Coordinate Transformation Matrix" 1 0 0 0 1 0 0 0 1
fi

polybar-msg cmd restart
