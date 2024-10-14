#!/bin/bash

# Define variables
GROUP_NUMBER="9"  # Your group number
ARCHIVE_DIR="archived_logs_group9"  # Use standard double quotes
REMOTE_USER="ba704bbbf90a"  # Your username
REMOTE_HOST="ba704bbbf90a.c0bb8d29.alu-cod.online"  # Your host
REMOTE_DIR="/home/"

# Create the archived logs directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Move all archived log files to the designated directory
# Assuming archived log files have the format heart_rate_log.txt_YYYYMMDD_HHMMSS
mv heart_rate_log.txt_* "$ARCHIVE_DIR"

# Check if the move was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to move archived log files."
    exit 1
fi

# Backup the archived logs to the remote server
scp -r "$ARCHIVE_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"

# Check if the SCP command was successful
if [ $? -eq 0 ]; then
    echo "Backup to remote server completed successfully."
else
    echo "Error: Backup to remote server failed."
    exit 1
fi

exit 0 
