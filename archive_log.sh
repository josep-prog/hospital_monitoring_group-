#!/bin/bash

# Log file
log_file="heart_rate_log.txt"

# Check if the log file exists
if [ -f "$log_file" ]; then
    # Generate timestamp
    timestamp=$(date +"%Y%m%d_%H%M%S")
    # Rename the log file
    mv "$log_file" "${log_file}_${timestamp}"
    echo "Log file archived as ${log_file}_${timestamp}"
else
    echo "Log file does not exist."
fi
