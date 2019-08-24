#! /bin/sh

#	8""""8
#	8      e   e e   e eeeee eeeee eeeee e   e  e eeeee
#	8eeeee 8   8 8   8   8   8   8 8  88 8   8  8 8   8
#	  	88 8eee8 8e  8   8e  8e  8 8   8 8e  8  8 8e  8
#	e   88 88  8 88  8   88  88  8 8   8 88  8  8 88  8
#	8eee88 88  8 88ee8   88  88ee8 8eee8 88ee8ee8 88  8

ANS=`echo -e "Lock \nLog out \nSwitch \nReboot \nShutdown" | dmenu_center -p Power`

case $ANS in
	"Lock ") dm-tool switch-to-greeter ;;
	"Reboot ") reboot ;;
	"Log out ") killall dwm ;;
	"Switch ") dm-tool switch-to-greeter ;;
	"Shutdown") shutdown now ;;
esac


echo test
