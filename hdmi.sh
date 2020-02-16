#!/bin/bash
hdmi() {
xrandr --output $1 --mode $2 &&
xrandr --output $3 --off
}

case $1 in 
  off) hdmi eDP1 1366x768 HDMI1 ;; 
  *) hdmi HDMI1 1024x768 eDP1 ;;
esac
