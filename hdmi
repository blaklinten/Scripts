#!/bin/bash
INTERNAL_SCREEN=$(xrandr|grep "primary"|awk '{print $1;}')
EXTERNAL_SCREEN=HDMI1
hdmi() {
xrandr --output $INTERNAL_SCREEN $1 $3 $4 --output $EXTERNAL_SCREEN $2 
}

case $1 in 
  off) hdmi --auto --off ;; 
  "+") hdmi --auto --auto --right-of $EXTERNAL_SCREEN ;;
  *) hdmi --off --auto ;;
esac
