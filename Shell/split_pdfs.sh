#!/bin/bash

# Prompt user for the input PDF file
echo "Enter the name of the PDF file to split:"
read -p "> " input_file

# Check if user provided input
if [ -z "$input_file" ]; then
  echo "No input PDF file provided. Exiting."
  exit 1
fi

# Prompt user for cut points
echo "Enter cut points to split the PDF (pages separated by spaces):"
read -p "> " cut_points

# Check if user provided cut points
if [ -z "$cut_points" ]; then
  echo "No cut points provided. Exiting."
  exit 1
fi

# Output file prefix
echo "Enter the prefix for the output files:"
read -p "> " output_prefix

# Check if user provided output file prefix
if [ -z "$output_prefix" ]; then
  echo "No output file prefix provided. Exiting."
  exit 1
fi

# Split PDF using pdftk
pdftk $input_file cat $cut_points output "${output_prefix}_%02d.pdf"

echo "PDF file split successfully."
