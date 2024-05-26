#!/bin/bash

# Audible outputs have a structure I don't like. Rename them first.
python rename_aax_files.py

# Wang through and convert AAX to MP3
convert_aax_to_mp3() {
    directory=$1
    cd "$directory"
    # Check if any MP3 files already exist in the directory. If so, skippity skip
    if [ -n "$(find . -maxdepth 1 -iname '*.mp3' -print -quit)" ]; then
        echo "Mebbe you did the one in $directory already? Skipping..."
    else
        # There *should* only be one... But you never know...
        for file in *.aax; do
            python ../conv.py -i "$file" -a 9f1ec808
        done
    fi
    # Go back up, ready for the next
    cd ..
}

zip_directories() {
    directory=$1
    # Dir without trailing slash
    dir_name=$(basename "$directory")
    # if zip exists
    if [ -f "${dir_name}.zip" ]; then
        echo "Zip for $directory already exists. Skipping..."
    else
        # Create a zip file for the directory excluding .aax files
        zip -r "${dir_name}.zip" "$directory" -x "*.aax"
    fi
}

###############

# Murder the CPU with separate processes...
for directory in */; do
    convert_aax_to_mp3 "$directory" &
done

# Hang around for them all to finish
wait

echo "Ding! Conversions went brrrr..."

#####

echo "Zipping resulting contents without *.aax"

# Loop through each directory and zip them
for directory in */; do
    zip_directories "$directory" &
done

wait

echo "Completed Zipping!"
