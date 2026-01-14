#!/bin/bash

# Prompt user for input
read -p "Enter the name of the photo file: " input_file
read -p "Enter the desired width: " width
read -p "Enter the desired height: " height

# Check if the file exists
if [ ! -f "$input_file" ]; then
  echo "Error: File not found!"
  exit 1
fi

# Resize the image using ImageMagick
output_file="resized_$input_file"
convert "$input_file" -resize ${width}x${height} "$output_file"

echo "Image resized successfully. Resized image saved as: $output_file"