#!/bin/bash

# Ask the user for the name of the video file
while true; do
    read -p "Enter the name of the video file: " video_file

    # Check if the file exists
    if [ -f "$video_file" ]; then
        # Check if it's a valid video file
        if file --mime-type "$video_file" | grep -q "video/"; then
            break
        else
            echo "Invalid video file. Please enter a valid video file."
        fi
    else
        echo "File does not exist. Please enter a valid file path."
    fi
done

# Ask the user for the start and end points in seconds
read -p "Enter the start point (in seconds): " start_point
read -p "Enter the end point (in seconds): " end_point

# Create a spliced video with the specified start and end points
output_file="spliced_output.mp4"
ffmpeg -ss "$start_point" -i "$video_file" -t "$((end_point - start_point))" -c:v copy -c:a copy "$output_file"

# Check if the splice was successful
if [ $? -eq 0 ]; then
    echo "Video spliced successfully. Output file: $output_file"
else
    echo "Error splicing video. Check your input values and try again."
fi
