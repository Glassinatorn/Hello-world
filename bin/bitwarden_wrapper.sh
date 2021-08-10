login() {
    export BW_SESSION="$(bw unlock --raw)" 
    bw sync
}

get_pass () {
    TMP_FOLDERS=$(bw list folders)
    TMP=$(echo $TMP_FOLDERS \
	| jq '.[] | select(.name)' \
	| grep -i name \
	| sed 's/"//g; s/name: //g' \
	| fzf \
	| cut -c 3-) 

    echo $TMP
    TMP_FOLDERS=$(bw list folders)
    TMP_ID=$(echo $TMP_FOLDERS \
	| jq --raw-output '.[] 
	    | select(.name == '\"$TMP\"')
	    | .id') 

    TMP_FOLDER=$(bw list items) 
    TMP_FOLDER=$(echo $TMP_FOLDER \
	| jq '.[] 
	    | select(.folderId == '\"$TMP_ID\"')') 

    TMP_SELECTED=$(echo $TMP_FOLDER \
	| jq --raw-output .name \
	| fzf) 

    TMP_CLIP=$(bw list items) 
    echo $TMP_CLIP \
	| jq --raw-output '.[] 
	    | select(.folderId == '\"$TMP_ID\"') 
	    | select(.name == '\"$TMP_SELECTED\"') 
	    | .login 
	    | .password' \
	| xclip -selection clipboard 
}

#create_folder () {}
#update_folder () {}
#delete_folder () {}
#create_item () {}
#update_item () {}
#remove_item () {}
#export_to_file() {}

logout() {
    bw lock
    export BW_SESSION="" 
}

login
CHOICES="Get Create Update Delete Logout"
# promts for what to do
select CHOICE in $CHOICES; do
    case $CHOICE in
	"Get")
	    get_pass
	    logout
	;;
	"Logout")
	    exit
    esac
done
