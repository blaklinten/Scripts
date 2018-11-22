#!/bin/zsh
read answer
if [[ $answer != "" ]] then
    exec firefox -new-tab $answer
#else if [[ $answer == "?"    
fi
