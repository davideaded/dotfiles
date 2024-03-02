#!/usr/bin/env bash

file_path="$HOME/.config/Code/User/"

if [ -n "$(find "$file_path" -maxdepth 1 -name '*.json' -print -quit)" ]; then
    echo "Copying files"
    cp "$file_path"*.json "$(pwd)"
    echo "Files copied successfully."
else
    echo "Failed to copy files: No .json files found."
fi

