#!/bin/bash
Ans=$(sed -n '1~2!p' ~/.bookmarks | dmenu -i)

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
        exec firefox -new-tab http://www.google.com/search?q=$Search
    fi
elif [[ $Ans != "" ]]
then
    if [[ $(sed -n "/^$Ans$/ {n;p}" ~/.bookmarks) == ""  ]]; then
        exec firefox -new-tab $Ans
    else
        exec firefox -new-tab $(sed -n "/^$Ans$/ {n;p}" ~/.bookmarks)
    fi
fi
