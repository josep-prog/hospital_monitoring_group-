#!/bin/bash

# Directory for archived logs
group_number=1  # Replace with your group number
archive_dir="archived_logs_group${group_number}"

# Create the archive directory if it doesn't exist
mkdir -p "$archive_dir"

# Move archived log files
mv heart_rate_log.txt_* "$archive_dir" 2>/dev/null

# Remote server details
remote_user="a8dbe5e653dc"  # Replace with your sandbox username
remote_host="https://a8dbe5e653dc.601a9382.alu-cod.online/"  # write your sandbox host
remote_dir="/home/"

# Backup to remote server
scp "$archive_dir/*" "$remote_user@$remote_host:$remote_dir"

echo "Backup completed."
