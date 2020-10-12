#! /bin/sh


#     @@@@@@   @@@ @@@   @@@@@@   @@@  @@@  @@@  @@@@@@@@   @@@@@@
#    @@@@@@@   @@@ @@@  @@@@@@@   @@@  @@@@ @@@  @@@@@@@@  @@@@@@@@
#    !@@       @@! !@@  !@@       @@!  @@!@!@@@  @@!       @@!  @@@
#    !@!       !@! @!!  !@!       !@!  !@!!@!@!  !@!       !@!  @!@
#    !!@@!!     !@!@!   !!@@!!    !!@  @!@ !!@!  @!!!:!    @!@  !@!
#     !!@!!!     @!!!    !!@!!!   !!!  !@!  !!!  !!!!!:    !@!  !!!
#         !:!    !!:         !:!  !!:  !!:  !!!  !!:       !!:  !!!
#        !:!     :!:        !:!   :!:  :!:  !:!  :!:       :!:  !:!
#    :::: ::      ::    :::: ::    ::   ::   ::   ::       ::::: ::
#    :: : :       :     :: : :    :    ::    :    :         : :  :


notify-send \
    "System info" "<b>  $(date | cut -b 12-16)   $(date | cut -d ' ' -f 1-3)</b> \
    \n\n \
    <b>Packages\n</b> \
    <i>Installed:</i> $(pacman -Q | wc -l)\n \
    <i>Upgrade:</i> $(pacman -Qu | wc -l)\n \
    \n \
    <b>Hardware</b> \n \
      $(acpi | cut -d ' ' -f 4) \n \
      $(acpi | cut -d ' ' -f 5)\n \
      $(pamixer --get-volume) \n \
      $(nmcli | grep "connected to" | cut -d ' ' -f 4)"