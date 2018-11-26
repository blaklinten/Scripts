#!/bin/bash
Ans=$(sed -n '1~2!p' ~/.bookmarks | dmenu -i)

if [[ $Ans == "AddBookmark" ]]
then
    echo $(echo "Input name of bookmark" | dmenu) >> ~/.bookmarks
    echo $(echo "Input URL of bookmark" | dmenu) >> ~/.bookmarks
    exit
elif [[ $Ans == "Google" ]]
then
    exec firefox -new-tab http://www.google.com/search?q=$(echo "Input Google search" | dmenu | sed 's/ /+/g')
elif [[ $Ans != "" ]]
then
    if [[ $(sed -n "/^$Ans$/ {n;p}" ~/.bookmarks) == ""  ]]
    then
        exec firefox -new-tab $Ans
    else
        exec firefox -new-tab $(sed -n "/^$Ans$/ {n;p}" ~/.bookmarks)
    fi
fi
