#!/bin/bash

# Unicode bars for levels 0-7
bar="▁▂▃▄▅▆▇█"
bar_length=${#bar}
dict="s/;//g"

# Build sed replacement rules: s/0/▁/g, s/1/▂/g, ..., s/7/█/g
for ((i = 0; i < bar_length; i++)); do
    dict+=";s/$i/${bar:$i:1}/g"
done

# Paths
config_file="$HOME/.config/cava/config-eww"
output_file="/tmp/eww_visualizer.txt"

# Generate cava config
mkdir -p "$(dirname "$config_file")"
cat >"$config_file" <<EOF
[general]
bars = 18

[input]
method = pulse
source = auto

[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

# Kill any existing cava using this config
pkill -f "cava -p $config_file"

# Run cava, parse output, and write each frame to file
cava -p "$config_file" | sed -u "$dict" | while read -r line; do
    echo "$line" > "$output_file"
done
