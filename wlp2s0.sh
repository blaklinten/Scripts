#!/bin/bash
sudo wpa_supplicant -B -c /etc/wpa_supplicant/wpa_supplicant-wlp2s0.conf -iwlp2s0
sudo dhclient
