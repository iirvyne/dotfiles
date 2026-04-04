#!/bin/bash

# Reload/Open eww
eww close yearbox
eww close monthbox
eww close daybox
eww close userinfo
eww close cava
eww close yuri

# Open widgets for monitor 1
eww open yearbox
eww open monthbox
eww open daybox
eww open userinfo
eww open cava
eww open yuri

bash ~/.config/eww/scripts/cava-eww.sh
