#!/bin/bash

current=$(powerprofilesctl get)

if [[ "$current" == "power-saver" ]]; then
    powerprofilesctl set performance
    echo "󰾅 Perf"
else
    powerprofilesctl set power-saver
    echo "󰾆 Save"
fi

