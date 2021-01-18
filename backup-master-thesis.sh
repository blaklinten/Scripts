#!/bin/sh

# Change these appropriately:
# --------------------------------------
REPO_NAME="git.overleaf.com/HASH" # Do _NOT_ add the ".git"-part of the URL, if any
OVERLEAF_USERNAME="student@student.chalmers.se"
TIME_TO_SLEEP="24h" #Back up once every 24 hours
# --------------------------------------

HTTPS_UNAME=$(echo $OVERLEAF_USERNAME | sed -e 's/\@/\%40/')
FOLDER_NAME="${REPO_NAME##*/}"
BACKUP_DEST="/storage/$USER/$FOLDER_NAME"

backup()
{
	cd $BACKUP_DEST
	while true; do
		git pull > ~/.backup.log
		sleep $TIME_TO_SLEEP
	done
}

if [ -d $BACKUP_DEST ]; then
	backup
else
 	cd /storage/$USER/
 	printf "%s\n" "Please enter your password when prompted."
 	git clone https://$HTTPS_UNAME@$REPO_NAME
 	cd $BACKUP_DEST
 	git config credential.helper store
 	cd
 	printf "%s\n" "Now run this program again with in the background '& disown'"

fi

