#!/bin/bash

# Define variables
GROUP_NUMBER="YOUR_GROUP_NUMBER"  # Replace with your actual group number
ARCHIVE_DIR="archived_logs_group$GROUP_NUMBER"   
REMOTE_USER="ba704bbbf90a"        # my username from sandbox
REMOTE_HOST="ba704bbbf90a.c0bb8d29.alu-cod.online"            # myhostname from sandbox password 
REMOTE_DIR="/home/"

# Create the archived logs directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Move all archived log files to the designated directory
# Assuming archived log files have a specific timestamped pattern, e.g., *.log.tar.gz
mv *archive*.log.tar.gz "$ARCHIVE_DIR"

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
