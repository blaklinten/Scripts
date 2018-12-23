#!/bin/bash
Type=$1
Session=-new-$Type
Ans=$(sed -n '1~2!p' ~/.bookmarks | dmenu -i)

if [[ $Ans == "Private" ]]
then
    Session=-private-window
    Ans=$(sed -n '1~2!p' ~/.bookmarks | sed -n '/Private/!p' | sed -n '/AddBookmark/!p' |  dmenu -i)
fi

if [[ $Ans == "AddBookmark" ]]; then
    Name=$(echo "Input name of bookmark" | dmenu)
    if [[ $Name != "" ]]; then
        URL=$(echo "Input URL of bookmark" | dmenu)
        if [[ $URL != "" ]]; then
            echo $Name >> ~/.bookmarks
            echo $URL >> ~/.bookmarks
        fi
    fi
    exit
elif [[ $Ans == "Google" ]]
then
    Search=$(echo "Input Google search" | dmenu | sed 's/ /+/g')
    if [[ $Search != "" ]]; then
        exec firefox $Session http://www.google.com/search?q=$Search
    fi
elif [[ $Ans != "" ]]
then
    if [[ $(sed -n "/^$Ans$/ {n;p}" ~/.bookmarks) == ""  ]]; then
        exec firefox $Session $Ans
    else
        exec firefox $Session $(sed -n "/^$Ans$/ {n;p}" ~/.bookmarks)
    fi
fi
