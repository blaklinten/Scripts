#!/bin/sh
 Ans=$(sed -n '1~2!p' ~/.bookmarks | dmenu -i)

 if [ ${Ans} = AddBookmark ]; then
     Name=$(echo "Input name of bookmark" | dmenu)
     if [ -n ${Name} ]; then
         URL=$(echo "Input URL of bookmark" | dmenu)
         if [ -n ${URL} ]; then
             echo $Name >> ~/.bookmarks
             echo $URL >> ~/.bookmarks
         fi
     fi
     exit
 elif [ ${Ans} = Google ]
 then
     Search=$(echo "Input Google search" | dmenu | sed 's/ /+/g')
     if [ -n $Search ]; then
         exec surf http://www.google.com/search?q=$Search
     fi
 elif [ -n  ${Ans} ]
 then
     if [ -z $(sed -n "/^$Ans$/ {n;p}" ~/.bookmarks) ]; then
         exec surf $Ans
     else
         exec surf $(sed -n "/^$Ans$/ {n;p}" ~/.bookmarks)
     fi
 fi
