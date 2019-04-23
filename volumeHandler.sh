#!/bin/bash

# Controls the volume of my outputs.

IFS=$'\n'
OPTION=$1

for device in $(pactl list sinks | sed -n /^.\*Name:.\*/p | sed s/^.\*Name:\ //); do
  case $OPTION in
    "inc")
      pactl set-sink-volume $device +5%
      ;;
    "dec")
      pactl set-sink-volume $device -5%
      ;;
    "mute")
      pactl set-sink-mute $device toggle
      ;;
    *)
      echo "Invalid option, try again."
      ;;
  esac
done
echo "Volume: $(pactl list sinks | sed -n /^.\*Volume:/p | head -n 1 | sed -e 's/.*\/\(.*\)\/.*/\1/'), $(pactl list sinks | sed -n /^.\*Mute:/p | head -n 1 | sed s/^.\*Mute:\ /Mute:\ /) " | xmessage -timeout 1 -center -file -
