#!/usr/bin/env bash

FILE=/mnt/2tb/other/github/irvyne/wallpaper/uploads/current.jpg
INTERVAL=5

while true; do
  awww img "$FILE"
  sleep $INTERVAL
done
