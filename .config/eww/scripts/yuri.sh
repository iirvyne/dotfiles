#!/usr/bin/env bash

# Folder with your images
IMAGE_DIR="$HOME/.config/eww/img"

# Pick a random image
RANDOM_IMAGE=$(find "$IMAGE_DIR" -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" \) | shuf -n 1)

# Output the path (Eww will use this)
echo "$RANDOM_IMAGE"
