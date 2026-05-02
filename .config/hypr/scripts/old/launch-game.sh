#!/bin/bash

### --- Game Launcher Wrapper for Hyprland + NVIDIA dGPU --- ###

# Game binary or Steam game command passed as argument
GAME_CMD="$@"

# Path to glxinfo (for debugging/logging if needed)
GLXINFO_BIN=$(which glxinfo)

# Use NVIDIA GPU only
export __NV_PRIME_RENDER_OFFLOAD=1
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __VK_LAYER_NV_optimus=NVIDIA_only

# Force correct refresh rate (adjust as needed)
export WLR_REFRESH=200

# Optional: Enable GameMode (if installed)
if command -v gamemoderun &> /dev/null; then
    GAME_CMD="gamemoderun $GAME_CMD"
fi

# Optional: Enable MangoHud (if installed)
if command -v mangohud &> /dev/null; then
    GAME_CMD="mangohud $GAME_CMD"
fi

# Optional: log GPU renderer used
echo "Using GPU: $($GLXINFO_BIN | grep 'OpenGL renderer' 2>/dev/null)" &

# Run the game
exec $GAME_CMD

