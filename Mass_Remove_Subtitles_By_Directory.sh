#!/bin/bash

# Prompt the user to enter the directory path
echo "Please enter the directory path containing the .mp4 files:"
read -r directory

# Check if the directory exists
if [ ! -d "$directory" ]; then
    echo "Directory not found: $directory"
    exit 1
fi

# Move to the directory
cd "$directory" || exit

# Loop through each .mp4 file in the directory
for file in *.mp4; do
    # Extract the filename without extension
    filename=$(basename "$file" .mp4)
    
    # Run ffmpeg command to remove subtitles and replace the original file
    ffmpeg -i "$file" -vcodec copy -acodec copy -sn "${filename}-no-subs.mp4" && \
    mv -f "${filename}-no-subs.mp4" "$file"
done
