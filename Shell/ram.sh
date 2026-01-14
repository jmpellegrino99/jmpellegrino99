#!/bin/bash

# Create or append to a text file to store the RAM usage data
output_file="ram_usage.log"

echo "Tracking RAM usage every 2 minutes..."
echo "time,ram_usage" > "$output_file"

while true; do
    # Get the current date and time
    current_date=$(date "+%Y-%m-%d %H:%M")

    # Use the vm_stat command to get RAM usage information and calculate the used RAM in MB
    ram_info=$(vm_stat | awk '/Pages active/{print $3*4/1024}')

    # Append the data to the output file
    echo "$current_date,$ram_info" >> "$output_file"   
    
    # Move the file to a csv
    cp ram_usage.log ~/Jupyter/ram_usage.csv

    # Sleep for 2 minutes
    sleep 60
done

