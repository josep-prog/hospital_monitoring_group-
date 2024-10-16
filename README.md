group9 Heart Rate Monitoring and Archival Project
Our project contains three Bash scripts for:
Heart Rate Monitoring: Logs heart rate data every second.
Log Archiving: Archives the log file with a timestamped name.
Archival Backup: Moves archived logs to a folder and backs them up to a remote server via SSH.
Make the scripts executable:
chmod +x heart_rate_monitor.sh archive_log.sh backup_archives.sh
1. Heart Rate Monitoring
Logs simulated heart rate data into heart_rate_log.txt.
./heart_rate_monitor.sh
Enter device name (e.g., Monitor_A).
View log updates:
tail -f heart_rate_log.txt
2. Log Archival
Renames heart_rate_log.txt with a timestamp.
./archive_log.sh
3. Backup Archived Logs
Moves archived logs to a directory and backs them up via SSH.
Edit the SSH details in backup_archives.sh and run:
./backup_archives.sh

i.e: we meet on google meet and with the group leader being Joseph Nishimwe
