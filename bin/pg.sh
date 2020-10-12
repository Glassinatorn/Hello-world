#! /bin/sh

#   @@@@@@   @@@@@@@@   @@@@@@   @@@@@@@    @@@@@@@  @@@  @@@
#  @@@@@@@   @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@@@@@@  @@@  @@@
#  !@@       @@!       @@!  @@@  @@!  @@@  !@@       @@!  @@@
#  !@!       !@!       !@!  @!@  !@!  @!@  !@!       !@!  @!@
#  !!@@!!    @!!!:!    @!@!@!@!  @!@!!@!   !@!       @!@!@!@!
#   !!@!!!   !!!!!:    !!!@!!!!  !!@!@!    !!!       !!!@!!!!
#       !:!  !!:       !!:  !!!  !!: :!!   :!!       !!:  !!!
#      !:!   :!:       :!:  !:!  :!:  !:!  :!:       :!:  !:!
#  :::: ::    :: ::::  ::   :::  ::   :::   ::: :::  ::   :::
#  :: : :    : :: ::    :   : :   :   : :   :: :: :   :   : :

# getting string to search for
if [ -z $1 ]; then
    read -p "What string do you want to search for?: " SEARCH
else
    SEARCH=$1
fi

# converting pdfs to txt and searching for specified string
for PDF in *.pdf; do
    pdftotext $PDF
done

CHOSEN=$(grep -i $SEARCH *.txt \
    | cut -d ':' -f 1 \
    | uniq \
    | fzf)
WORD=$(grep -i $SEARCH $CHOSEN \
    | fzf)

rm *.txt

# opening pdf with searched string and putting string into clipboard
printf $WORD \
    | xclip -selection c
zathura $(printf "$CHOSEN" | cut -d '.' -f 1).pdf
