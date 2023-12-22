#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Launch Minecraft
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🚀
# @raycast.argument1 { "type": "text", "placeholder": "1.20.2" }
# @raycast.packageName Prism Launcher

# Documentation:
# @raycast.description Launches a Minecraft instance using Prism Launcher
# @raycast.author Gijs de Jong
# @raycast.authorURL https://github.com/oxkitsune

# Prism Launcher binary
PRISM_LAUNCHER_BIN="/Applications/Prism Launcher.app/Contents/MacOS/prismlauncher"
PRISM_LAUNCHER_INSTANCES="$HOME/Library/Application Support/PrismLauncher/instances"


# checks if the prism launcher binary exists
if [ ! -f "$PRISM_LAUNCHER_BIN" ]; then
  echo "Prism Launcher not found!"
  exit 1
fi

# checks if the argument is empty
if [ -z "$1" ]; then
  echo "Please provide a valid instance!"
  exit 1
fi

# checks if the argument is a valid launch profile
if [ ! -d "$PRISM_LAUNCHER_INSTANCES/$1" ]; then
  echo "Instance not found!"
  exit 1
fi

# launch the instance
"$PRISM_LAUNCHER_BIN" --launch "$1"
