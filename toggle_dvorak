#!/bin/sh

DVORAK="setxkbmap se -variant svdvorak"
QWERTY="setxkbmap se"
QUERY="setxkbmap -query"

$QUERY | grep "svdvorak" > /dev/null && $QWERTY || $DVORAK
