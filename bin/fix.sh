#! /bin/sh


#    @@@@@@@@  @@@  @@@  @@@
#    @@@@@@@@  @@@  @@@  @@@
#    @@!       @@!  @@!  !@@
#    !@!       !@!  !@!  @!!
#    @!!!:!    !!@   !@@!@!
#    !!!!!:    !!!    @!!!
#    !!:       !!:   !: :!!
#    :!:       :!:  :!:  !:!
#     ::        ::   ::  :::
#     :        :     :   ::

# settings for laptop touchpad
xinput --set-prop 10 "libinput Accel Speed" 0.2
xinput --set-prop 10 "libinput Tapping Enabled" 1
xinput --set-prop 10 "libinput Disable While Typing Enabled" 0

# counting connected screens
NUM_MONITORS=$(xrandr \
    | grep connected \
    | grep -v disconnected \
    | wc -l)

# setup for screens
case $NUM_MONITORS in
    1)
        setxkbmap -layout se -option ctrl:nocaps
        xmodmap -e 'clear lock'
        xmodmap -e 'keycode 0x7e = Control_R'
        xmodmap -e 'add Control = Control_R'
        ;;
    2)
        xinput --map-to-output "Wacom HID 5113 Pen stylus" eDP1
        xinput --map-to-output "Wacom HID 5113 Finger touch" eDP1

        setxkbmap -layout se -option ctrl:nocaps
        xmodmap -e 'clear lock'
        xmodmap -e 'keycode 0x7e = Control_R'
        xmodmap -e 'add Control = Control_R'

        # gifwall.sh ~/Freetime/Pictures/gifWallpaper/portrait_trainEvening.gif
        ;;

    3)
        ~/.screenlayout/3.sh
        xinput --map-to-output "Wacom HID 5113 Pen stylus" eDP1
        xinput --map-to-output "Wacom HID 5113 Finger touch" eDP1

        setxkbmap -layout us -option ctrl:nocaps
        xmodmap -e 'clear lock'
        xmodmap -e 'keycode 0x7e = Control_R'
        xmodmap -e 'add Control = Control_R'

        # gifwall.sh ~/Freetime/Pictures/gifWallpaper/portrait_trainEvening.gif
        ;;

    4)
        ~/.screenlayout/4.sh
        setxkbmap -layout us

esac

# starting backround processes
killall unclutter
unclutter -idle 0.5 -root &
~/.fehbg
# killing old sxhkd processes
killall sxkhd

# starting keybinding daemon
if [ $GDMSESSION = "awesome" ]; then
    sxhkd -c ~/.config/sxhkd/sxhkdrc \
             ~/.config/sxhkd/awesome_sxhkdrc
elif [ $GDMSESSION = "bspwm" ]; then
    sxhkd -c ~/.config/sxhkd/sxhkdrc \
             ~/.config/sxhkd/bspwm_sxhkdrc
elif [ $GDMSESSION = "dwm" ]; then
    sxhkd -c ~/.config/sxhkd/sxhkdrc \
             ~/.config/sxhkd/dwm_sxhkdrc
fi
