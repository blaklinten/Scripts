#!/bin/sh

# Change these appropriately:
# --------------------------------------
HASH="_hash_" # Do _NOT_ add the ".git"-part of the URL, if any
OVERLEAF_USERNAME="_student_@student.chalmers.se"
TIME_TO_SLEEP="24h" #Back up once every 24 hours
# --------------------------------------

OVERLEAF_URL="git.overleaf.com"
HTTPS_UNAME=$(echo $OVERLEAF_USERNAME | sed -e 's/\@/\%40/')
BACKUP_DEST="/storage/$USER/$HASH"

backup()
{
	while true; do
		printf "%s\n" "$(date)" >> "$HOME/.backup-$HASH.log"
		git pull >> "$HOME/.backup-$HASH.log"
		sleep $TIME_TO_SLEEP
	done
}

if [ -d $BACKUP_DEST ]; then
	cd $BACKUP_DEST
    backup
else
    cd /storage/$USER/
    printf "%s\n" "Please enter your password when prompted."
    git clone https://$HTTPS_UNAME@$OVERLEAF_URL/$HASH
    cd $BACKUP_DEST
    git config credential.helper store
    cd
    printf "%s\n" "Now run this program again with in the background '& disown'"
fi
