#!/bin/bash

VIDEO_DIRECTORY=""
OUTPUT_FILE=""

# Remove the existing subs.txt file
rm -f "$OUTPUT_FILE"

find "$VIDEO_DIRECTORY" -type f -name '*.mp4' -print0 | while IFS= read -r -d '' file; do
    echo "Checking file: $file"
    # Check if the file contains text, subtitle, or attachment information
    if mediainfo "$file" | grep -q -E -i "Text|Subtitle|Attachment"; then
        echo "$file" >> "$OUTPUT_FILE"
    fi
done
