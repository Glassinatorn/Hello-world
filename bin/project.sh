#! /bin/sh

# prompting the user to chose what 
OPTIONS="python \nrust \nc"
CHOSEN=$(echo $OPTIONS | fzf)

case $CHOSEN in
    "python")
	# TODO: 
	# check if there is already a created project in the current folder
	touch requirements.txt
	python -m venv env &&
	    source env/bin/activate
	pip install neovim
    ;;
    "rust")
	printf "you chose rust\n"
    ;;
    "c")
	mkdir tests src bin
	touch Makefile
    *)
esac

printf "-------------------\n"
printf "      DONE!!       \n"
printf "-------------------\n"
