#!/bin/sh

# A small timer script

let START=$(date +%s)
while true; do
  DIFF=$(expr $(date +%s) - $START);
  HOURS=$(expr $DIFF / 3600)
  echo $DIFF;
  sleep 1s;
done
