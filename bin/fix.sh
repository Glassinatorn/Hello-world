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


xinput --set-prop "SYNA2B31:00 06CB:7F8B Touchpad" "libinput Accel Speed" 0.2
xinput --set-prop "SYNA2B31:00 06CB:7F8B Touchpad" "libinput Tapping Enabled" 1
xinput --set-prop "SYNA2B31:00 06CB:7F8B Touchpad" "libinput Disable While Typing Enabled" 0

case $(xrandr | grep connected | grep -v disconnected | wc -l) in
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

        nitrogen --restore
        gifwall.sh ~/Freetime/Pictures/gifWallpaper/portrait_trainEvening.gif
        ;;

    3)
        ~/.screenlayout/3.sh
        xinput --map-to-output "Wacom HID 5113 Pen stylus" eDP1
        xinput --map-to-output "Wacom HID 5113 Finger touch" eDP1

        setxkbmap -layout us -option ctrl:nocaps
        xmodmap -e 'clear lock'
        xmodmap -e 'keycode 0x7e = Control_R'
        xmodmap -e 'add Control = Control_R'

        nitrogen --restore
        #gifwall.sh ~/Freetime/Pictures/gifWallpaper/portrait_trainEvening.gif
        ;;
esac

unclutter -idle 0.01 -root &
~/.fehbg
killall sxhkd

if [ $GDMSESSION = "awesome" ]
then
    echo "awesome1"
    sxhkd -c ~/.config/sxhkd/sxhkdrc \
             ~/.config/sxhkd/awesome_sxhkdrc
elif [ $GDMSESSION = "bspwm" ]
then
    echo "bspwm"
    sxhkd -c ~/.config/sxhkd/sxhkdrc \
             ~/.config/sxhkd/bspwm_sxhkdrc
elif [ $GDMSESSION = "dwm" ]
then
    echo "dwm"
    sxhkd -c ~/.config/sxhkd/sxhkdrc \
             ~/.config/sxhkd/dwm_sxhkdrc
fi
