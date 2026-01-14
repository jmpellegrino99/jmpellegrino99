#!/bin/bash

while true; do
    # Ask the user for the name of the video file
    read -p "Enter the name of the video file: " video_file

    # Check if the file exists
    if [ -f "$video_file" ]; then
        # Check if it's an MP4 file
        if file --mime-type "$video_file" | grep -q "video/mp4"; then
            break
        else
            echo "Invalid file. Please enter a valid MP4 file."
        fi
    else
        echo "File does not exist. Please enter a valid file path."
    fi
done

# Ask the user for the horizontal and vertical resolution dimensions:
read -p "Enter the horizontal resolution: " hor
read -p "Enter the vertical resolution: " ver

# Create a resize of the video with the specified resolution:
output_file="resized_output.mp4"
ffmpeg -i "$video_file" -vf scale="$hor":"$ver" -c:a copy "$output_file"

# Check if the resize was successful
if [ $? -eq 0 ]; then
    echo "Resize created successfully. Output file: $output_file"
else
    echo "Error creating resize. Check your input values and try again."
fi