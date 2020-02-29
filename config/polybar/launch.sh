#!/usr/bin/env sh

#Terminate already running bar instances
killall -q polybar
monitors=$(xrandr | grep DP-0 | awk '{print $2}')
#Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

mon=$(xrandr | grep mm | wc -l)

case $mon in
    1)
        polybar edp-1 -r &
        polybar edp-2 -r &
        polybar edp-3 -r &
        ;;

    2)
        polybar 4k-1 -r &
        polybar 4k-2 -r &
        polybar 4k-3 -r &
        ;;

    3)
        polybar dp1-1 -r &
        polybar dp1-2 -r &
        polybar dp2-1 -r &
        polybar dp2-2 -r &
        ;;
esac


