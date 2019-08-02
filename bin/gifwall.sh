#! /bin/sh

#	8""""8 8  8"""" 8   8  8 8""""8 8     8
#	8    " 8  8     8   8  8 8    8 8     8
#	8e     8e 8eeee 8e  8  8 8eeee8 8e    8e
#	88  ee 88 88    88  8  8 88   8 88    88
#	88   8 88 88    88  8  8 88   8 88    88
#	88eee8 88 88    88ee8ee8 88   8 88eee 88eee


xwinwrap -g 240x240+839+297 -ov -sh circle -- \
	gifview -w WID $1 -a
