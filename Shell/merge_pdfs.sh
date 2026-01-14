#!/bin/bash

# Prompt user for PDF file names
echo "Enter the names of PDF files to merge (separated by spaces):"
read -p "> " pdf_files

# Check if user provided input
if [ -z "$pdf_files" ]; then
  echo "No PDF files provided. Exiting."
  exit 1
fi

# Output file name
echo "Enter the name for the merged PDF file:"
read -p "> " output_file

# Check if user provided output file name
if [ -z "$output_file" ]; then
  echo "No output file name provided. Exiting."
  exit 1
fi

# Merge PDF files using pdftk
pdftk $pdf_files cat output $output_file

echo "PDF files merged successfully into $output_file."
