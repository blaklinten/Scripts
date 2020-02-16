#!/bin/bash
hdmi() {
xrandr --output $1 --auto --output $2 --off
}

case $1 in 
  off) hdmi eDP1 HDMI1 ;; 
  *) hdmi HDMI1 eDP1 ;;
esac
