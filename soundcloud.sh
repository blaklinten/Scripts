#!/bin/bash

if [ -z "$1" ]; then
	PLAYLIST="$HOME/.soundcloud"
	while IFS= read -r line || [ -n "$line" ]; do
		cvlc "$line"
	done < "$PLAYLIST"
else
	PLAYLIST="$1"
	cvlc "$PLAYLIST"
fi
