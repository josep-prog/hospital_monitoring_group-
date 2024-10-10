#!/bin/bash

# Prompt for the device name
read -p "Enter device name (e.g., Monitor_A): " device_name

# Log file
log_file="heart_rate_log.txt"

# Function to generate a random heart rate
generate_heart_rate() {
    echo $(( RANDOM % 100 + 40 ))  # Heart rate between 40 and 139
}

# Start logging in the background
{
    while true; do
        # Get the current timestamp
        timestamp=$(date +"%Y-%m-%d %H:%M:%S")
        # Generate simulated heart rate
        heart_rate=$(generate_heart_rate)
        # Log to the file
        echo "$timestamp $device_name $heart_rate" >> "$log_file"
        sleep 1
    done
} &

# Output the process ID
echo "Heart rate monitoring started with PID: $!"
