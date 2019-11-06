#! /bin/sh

#	""8""
#	  8   eeeeeee e   e e    e
#	  8e  8  8  8 8   8 8    8
#	  88  8e 8  8 8e  8 eeeeee
#	  88  88 8  8 88  8 88   8
#	  88  88 8  8 88ee8 88   8


ANS=$(tmux ls | awk '{print $1}' | cut -d ":" -f1 | \
      dmenu_center -p Tmux)

tmux a -t $ANS
