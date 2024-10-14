#!/bin/bash

# Define variables
GROUP_NUMBER=9  # Your group number
ARCHIVE_DIR= archived_logs_group9
REMOTE_USER= ba704bbbf90a # my username
REMOTE_HOST= ba704bbbf90a.c0bb8d29.alu-cod.online  # my host
REMOTE_DIR="/home/"

# Create the archived logs directory if it doesn't exist
mkdir -p archived_logs_group9

# Move all archived log files to the designated directory
# Assuming archived log files have the format heart_rate_log.txt_YYYYMMDD_HHMMSS
mv heart_rate_log.txt_*  archived_logs_group9

# Check if the move was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to move archived log files."
    exit 1
fi

# Backup the archived logs to the remote server
scp -r archived_logs_group9/   ba704bbbf90a@ba704bbbf90a.c0bb8d29.alu-cod.online:/home/

# Check if the SCP command was successful
if [ $? -eq 0 ]; then
    echo "Backup to remote server completed successfully."
else
    echo "Error: Backup to remote server failed."
    exit 1
fi

exit 0 
