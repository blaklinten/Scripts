#!/bin/bash 
pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo -5%
xmessage -timeout 1 -center - $(pactl list sinks | grep 'Volume: front-left' | tail -n 1 | sed -e 's/.*\/\(.*\)\/.*/\1/')
