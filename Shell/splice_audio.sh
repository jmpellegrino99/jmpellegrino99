#!/bin/bash

echo "Enter the name of the music file (including the extension):"
read file

# Check if the entered value is a file
if [ ! -f "$file" ]; then
    echo "Error: Not a file. Exiting."
    exit 1
fi

echo "Enter the start time in seconds:"
read start_time

echo "Enter the end time in seconds:"
read end_time

# Use ffmpeg to clip the audio
ffmpeg -i "$file" -ss "$start_time" -to "$end_time" -c copy "clipped_$file"

echo "File successfully clipped to the specified region. Output file: clipped_$file"