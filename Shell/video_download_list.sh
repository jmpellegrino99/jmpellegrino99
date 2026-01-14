#!/usr/bin/bash

# Capture titles and links into separate arrays efficiently
readarray -t titles < <(cat videos.csv | awk -F',' 'NR>1 { print $1 }')
readarray -t links < <(cat videos.csv | awk -F',' 'NR>1 { print $2 }')

# Get the number of elements (assuming both arrays have the same length)
num_elements="${#titles[@]}"

counter=0

while [[ $counter -lt $num_elements ]]; do
  # Use counter to access corresponding elements
  yt_dlp_cmd="/home/jpell/yt-dlp -o\"${titles[$counter]}\" \"${links[$counter]}\""
  # Execute the download command
  bash -c "$yt_dlp_cmd"
  ((counter++))
done