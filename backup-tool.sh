#!/bin/bash
DISK_THRESHOLD=80
DISK=0
check_disk() {
    DISK=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    echo -e "\nChecking Disk Space: $DISK%"
 }
if [ -z "$1" ]; then
	echo "usage: ./backup-tool.sh [file location]"
elif [ -d "$1" ]; then
	check_disk
	if [ $DISK -gt $DISK_THRESHOLD ]; then
	echo "Disk almost full back up aborted"
	else
		TIMESTAMP=$(date +%Y-%m-%d-%H-%M)
		echo "Creating backup..."
		tar -czf ~/devops-backup-tool/backups/backup-$TIMESTAMP.tar.gz $1
		echo "Backup successful!"
		cd ~/devops-backup-tool
		echo "Backup - $TIMESTAMP - $1" >> logs/backup.log
		git add logs/backup.log
		git commit -m "Backuplog: $TIMESTAMP"
		git push -u origin master
	fi
else
	echo "Error: $1 is not a valid directory"
fi

