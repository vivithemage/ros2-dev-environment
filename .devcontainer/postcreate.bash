#!/bin/bash
set -e  # Exit immediately if a command fails

echo "Starting postCreateCommand"
sudo apt-get update
rosdep update --include-eol-distros
rosdep install --from-paths src --ignore-src -y
sudo chown -R $(whoami) /home/$(whoami)
sudo usermod -a -G dialout $(whoami)
echo "Completed postCreateCommand"
