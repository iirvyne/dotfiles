#!/bin/bash

# Get used RAM in MB
used_mb=$(free -m | awk '/^Mem:/ {print $3}')

# Convert MB to GB with 2 decimal places
used_gb=$(echo "scale=0; $used_mb/1024" | bc)

echo "${used_gb}GB"
