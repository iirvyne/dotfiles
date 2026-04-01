#!/usr/bin/env bash

sensors | grep 'mem' | awk '{printf "%d°C\n", $2}' | tr -d '+'
