#!/bin/bash

# Audible outputs have a structure I don't like. Rename them first.
python rename_aax_files.py

# Wang through and convert AAX to MP3
for directory in */; do
    # Any dirs in here should've been created by the rename script...
    cd "$directory"
    # Check if any MP3 files already exist in the directory. If so, skippity skip
    if [ -n "$(find . -maxdepth 1 -iname '*.mp3' -print -quit)" ]; then
        echo "Mebbe you did the one in $directory already? Skipping..."
    else
        # There *should* only be one... But you never know...
        for file in *.aax; do
            python ../conv.py -i "$file" -a ADD_BYTES_HERE
        done
    fi
    # Go back up, ready for the next
    cd ..
done
