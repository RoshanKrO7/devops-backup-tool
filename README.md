# DevOps Backup Tool

A bash script that automatically backs up directories and tracks logs in GitHub.

## Features
- Checks disk space before backup
- Creates timestamped `.tar.gz` backups
- Logs every backup with timestamp
- Auto commits and pushes logs to GitHub

## Usage
```bash
./backup-tool.sh [directory]
```

## Example
```bash
./backup-tool.sh ~/devops-practice
```

## Output
Checking Disk Space: 1%
Creating backup...
Backup successful!

## Author
Roshan Kumar
