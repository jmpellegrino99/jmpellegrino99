#!/bin/bash

log_file="~/ram_usage.log"

while true; do
    # Get current date and time
    timestamp=$(date "+%Y-%m-%d %H:%M:%S")

    # Get RAM usage and write to log file
    ram_usage=$(free -m | awk '/Mem:/ {print $3}')
    echo "$timestamp RAM Usage: $ram_usage MB" >> "$log_file"

    # Sleep for 1 minute before checking again
    sleep 60
done

