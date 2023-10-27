# TODO:
# - make sure variables are cleaned after use []
# - move TMP outside of function to reduce load times []
# - empty clipboard after usage []
# - implement create []
# - implement update []
# - implement delete []
# - implement export []

login() {
    BW_SESSION=$(bw unlock --raw)
    bw sync --session $BW_SESSION
}

get_pass () {
    # chosing folder
    TMP_FOLDERS=$(bw list folders --session $BW_SESSION)
    TMP=$(echo $TMP_FOLDERS \
	| jq '.[] | select(.name)' \
	| grep -i name \
	| sed 's/"//g; s/name: //g' \
	| fzf \
	| cut -c 3-) 

    # 
    TMP_FOLDERS=$(bw list folders --session $BW_SESSION)
    TMP_ID=$(echo $TMP_FOLDERS \
	| jq --raw-output '.[] 
	    | select(.name == '\"$TMP\"')
	    | .id') 

    TMP_FOLDER=$(bw list items --session $BW_SESSION) 
    TMP_FOLDER=$(echo $TMP_FOLDER \
	| jq '.[] 
	    | select(.folderId == '\"$TMP_ID\"')') 

    TMP_SELECTED=$(echo $TMP_FOLDER \
	| jq --raw-output .name \
	| fzf) 

    TMP_CLIP=$(bw list items --session $BW_SESSION) 
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
# promts for what to do
#select CHOICE in "Get" "Create" "Update" "Delete" "Logout"; do
    #case $CHOICE in
	#"Get")
	    get_pass
	    logout
	#;;
	#"Logout")
	    #exit
    #esac
#done
