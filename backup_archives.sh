#!/bin/bash

# Define variables
GROUP_NUMBER="9"  # Your group number
ARCHIVE_DIR="archived_logs_group9"
REMOTE_USER="ba704bbbf90a"  # My username
REMOTE_HOST="ba704bbbf90a.c0bb8d29.alu-cod.online"  # My host
REMOTE_DIR="/home/"

# Create the archived logs directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Move the archived log file to the designated directory
mv heart_rate_log.txt   "$ARCHIVE_DIR"

# Check if the move was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to move archived log files."
    exit 1
fi

# Backup the archived logs to the remote server
scp -r "$ARCHIVE_DIR/" "ba704bbbf90a.c0bb8d29.alu-cod.online"

# Check if the SCP command was successful
if [ $? -eq 0 ]; then
    echo "Backup to remote server completed successfully."
else
    echo "Error: Backup to remote server failed."
    exit 1
fi

exit 0
