#!/bin/bash

# Get CPU power from RAPL interface
cpu_power=$(cat /sys/class/powercap/intel-rapl:0/energy_uj 2>/dev/null)
sleep 1
cpu_power_2=$(cat /sys/class/powercap/intel-rapl:0/energy_uj 2>/dev/null)

# Calculate CPU power in watts
cpu_power_watt=$(awk -v p1="$cpu_power" -v p2="$cpu_power_2" 'BEGIN { printf "%.1f", (p2 - p1) / 100000 / 0.1 }')

# Get GPU power using nvidia-smi
gpu_power=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits 2>/dev/null | awk '{ print $1 }')

# Fallback if nvidia-smi not available
[[ -z "$gpu_power" ]] && gpu_power=0

# Add up
total=$(awk -v cpu="$cpu_power_watt" -v gpu="$gpu_power" 'BEGIN { printf "%.1f", cpu + gpu }')

echo "Total Power: ${total}W (CPU: ${cpu_power_watt}W + GPU: ${gpu_power}W)"

