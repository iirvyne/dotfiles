#!/bin/bash

# Get JSON of the focused window
win_json=$(hyprctl -j activewindow)

# Try to get window title
title=$(echo "$win_json" | jq -r '.title')

# If empty or null, fallback to app class
if [[ "$title" == "null" || -z "$title" ]]; then
  title=$(echo "$win_json" | jq -r '.class')
fi

echo "$title"
