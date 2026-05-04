#!/bin/bash

STATE_FILE="$HOME/.config/theme/current"

# Default to dark if file doesn't exist
if [ ! -f "$STATE_FILE" ]; then
  echo "dark" >"$STATE_FILE"
fi

CURRENT=$(cat "$STATE_FILE")

if [ "$CURRENT" = "dark" ]; then
  THEME="light"
else
  THEME="dark"
fi

echo "$THEME" >"$STATE_FILE"

# ----- Set colours -----

# btop
cp ~/.config/btop/themes/colors-$THEME.theme ~/.config/btop/themes/colors.theme

# cava
cp ~/.config/cava/config-$THEME ~/.config/cava/config
cava r

# dunst & rofi
cp ~/.config/rofi/theme-$THEME.rasi ~/.config/rofi/theme.rasi

# eww
cp ~/.config/eww/eww-$THEME.scss ~/.config/eww/eww.scss
eww reload

# hypr
cp ~/.config/hypr/conf/theme-$THEME.lua ~/.config/hypr/conf/theme.lua

# kitty
cp ~/.config/kitty/theme-$THEME.conf ~/.config/kitty/theme.conf

# nvim
#cp ~/.config/nvim/lua/config/options-$THEME.lua ~/.config/nvim/lua/config/options.lua

# awww
awww img --transition-type wipe --transition-duration 1 --transition-angle 60 --transition-step 200 --transition-fps 200 ~/.config/hypr/assets/s_wallpaper-$THEME.gif &

# GTK
gsettings set org.gnome.desktop.interface gtk-theme irvyne-$THEME
gsettings set org.gnome.desktop.interface color-scheme prefer-$THEME

sleep 0.5
notify-send "Changed to $THEME theme!"
