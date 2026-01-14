#!/bin/bash

# Set the source directory and backup directory
source_dir="$HOME"
backup_dir="/home/jpell/backup"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Use find and md5sum to identify duplicate files in the source directory and its subdirectories
find "$source_dir" -type f -exec md5sum {} + | \
  awk '{print $1,$2}' | \
  sort | \
  uniq -d -w32 | \
  cut -d' ' -f2- > /tmp/duplicate_files.txt

# Loop through the duplicate files and move them to the backup directory
while read -r file; do
  # Get the relative path of the file
  relative_path="${file#$source_dir/}"

  # Create the target directory in the backup location
  target_dir="$backup_dir/$(dirname "$relative_path")"
  mkdir -p "$target_dir"

  # Move the duplicate file to the backup directory while preserving the directory structure
  mv "$file" "$target_dir/"
  echo "Moved: $file"
done < /tmp/duplicate_files.txt

# Clean up the temporary file
rm /tmp/duplicate_files.txt

echo "Duplicate files have been moved to $backup_dir."
