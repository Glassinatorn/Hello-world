#! /bin/sh
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
    BW_ITEMS=$(bw list items --session $BW_SESSION) 
    BW_FOLDERS=$(bw list folders --session $BW_SESSION)
}

sync() {
    bw sync --session $BW_SESSION 
}

get_pass() {
    # chosing folder
    TMP=$(printf '%s' $BW_FOLDERS \
	| jq '.[] | select(.name)' \
	| grep -i name \
	| sed 's/"//g; s/name: //g' \
	| fzf \
	| cut -c 3-) 

    # getting ID of chosen folder
    TMP_ID=$(printf '%s' $BW_FOLDERS \
	| jq --raw-output '.[] 
	    | select(.name == '\"$TMP\"')
	    | .id') 

    # getting items inside of chosen folder
    SELECTED=$(printf '%s' $BW_ITEMS | 
	jq '.[] | 
	    select(.folderId == '\"$TMP_ID\"') |
	    .name' | 
	    fzf | 
	    sed 's/"//g')

    # getting password from chosen item
    printf '%s' $BW_ITEMS | 
	jq --raw-output '.[] | 
	    select(.folderId == '\"$TMP_ID\"') | 
	    select(.name == '\"$SELECTED\"') | 
	    .login | 
	    .password' | 
	xclip -sel clip
}

create_item() {
    read -p "Name: " NAME
    read -p "Note: " NOTE
    read -p "Username: " USER
    read -p "Password: " PASS

    # chosing folder
    TMP=$(printf '%s' $BW_FOLDERS \
	| jq '.[] | select(.name)' \
	| grep -i name \
	| sed 's/"//g; s/name: //g' \
	| fzf \
	| cut -c 3-) 
    
    # getting ID of chosen folder
    TMP=$(printf '%s' $BW_FOLDERS \
	| jq --raw-output '.[] 
	    | select(.name == '\"$TMP\"')
	    | .id') 

    TMP='{
      '\"'object'\"': '\"'item'\"',
      '\"'type'\"': 1,
      '\"'folderId'\"': '\"$TMP\"',
      '\"'name'\"': '\"$NAME\"',
      '\"'notes'\"': '\"$NOTE\"',
      '\"'login'\"': {
	'\"'username'\"': '\"$USER\"',
	'\"'password'\"': '\"$PASS\"',
	'\"'passwordRevisionDate'\"': null
      },
      '\"'deletedDate'\"': null
    }'

    TMP=$(echo $TMP | bw encode)

    # creating the item
    bw create item $TMP --session $BW_SESSION

}

#create_folder () {}
#update_folder () {}
#delete_folder () {}
#create_item () {}
update_item () {
    # chosing folder
    TMP=$(printf '%s' $BW_FOLDERS \
	| jq '.[] | select(.name)' \
	| grep -i name \
	| sed 's/"//g; s/name: //g; s/No Folder/null/g' \
	| fzf \
	| cut -c 3-) 
    
    if [ "$TMP" != "null" ]; then
	# getting ID of chosen folder
	TMP=$(printf '%s' $BW_FOLDERS \
	    | jq --raw-output '.[] 
		| select(.name == '\"$TMP\"')
		| .id') 

	# getting items inside of chosen folder
	SELECTED=$(printf '%s' $BW_ITEMS | 
	    jq '.[] | 
		select(.folderId == '\"$TMP\"') |
		.name' | 
		fzf | 
		sed 's/"//g')

	SELECTED=$(bw get item $SELECTED --session $BW_SESSION | jq '.id' | sed 's/"//g')

    else
	# getting items inside of chosen folder
	SELECTED=$(printf '%s' $BW_ITEMS | 
	    jq '.[] | 
		select(.folderId == '$TMP') |
		.id' | 
		fzf | 
		sed 's/"//g')
    fi


    read -p "Note: " NOTE
    read -p "Username: " USER
    read -p "Password: " PASS

    bw get item $SELECTED \
	| jq '.notes="testing note again" 
	    | .login.username="newuser" 
	    | .login.password="newpass"' | 
	bw encode | 
	bw edit item $SELECTED --session $BW_SESSION

    # editing
    #bw edit item $TMP $SELECTED --session $BW_SESSION
}

delete_item () {
    # chosing folder
    TMP=$(printf '%s' $BW_FOLDERS \
	| jq '.[] | select(.name)' \
	| grep -i name \
	| sed 's/"//g; s/name: //g' \
	| fzf \
	| cut -c 3-) 

    # getting ID of chosen folder
    TMP_ID=$(printf '%s' $BW_FOLDERS \
	| jq --raw-output '.[] 
	    | select(.name == '\"$TMP\"')
	    | .id') 

    # getting items inside of chosen folder
    SELECTED=$(printf '%s' $BW_ITEMS | 
	jq '.[] | 
	    select(.folderId == '\"$TMP_ID\"') |
	    .name' | 
	    fzf | 
	    sed 's/"//g')

    # creating query
    TMP='{
      '\"'object'\"': '\"'item'\"',
      '\"'notes'\"': '\"$NOTE\"',
      '\"'login'\"': {
	'\"'username'\"': '\"$USER\"',
	'\"'password'\"': '\"$PASS\"',
      },
    }'

    bw delete item $SELECTED
}

#export_to_file() {}

logout() {
    BW_FOLDERS=""
    BW_ITEMS=""
    BW_SESSION="" 
    bw lock
}

clean() {
    TMP=""
    TMP_ID=""
    SELECTED=""

    for index in $(seq 1 5); do
	echo $index".."
	sleep $index
    done

    echo "Cleaning clipboard!" 
    xclip -sel clip < /dev/null
}

login
# promts for what to do
select CHOICE in "Sync" "Get" "Update" "Create" "Delete" "Logout"; do
    case $CHOICE in 
	"Sync")
	    sync
	    ;;
	"Get")
	    get_pass
	    clean
	    ;;
	"Update")
	    update_item
	    ;;
	"Create")
	    create_item
	    ;;
	"Delete")
	    delete_item
	    ;;
	"Logout")
	    clean
	    exit
	    ;;
    esac

    echo -e "1) Sync \n2) Get \n3) Update \n4) Create \n5) Delete \n6) Logout"
done
logout
