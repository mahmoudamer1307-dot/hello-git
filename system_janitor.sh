#!/bin/bash

# System Janitor - Disk Cleanup Script
# Developed by: Mahmoud Amer

# Ensure the script runs as Root
if [ "$EUID" -ne 0 ]; then 
  echo "Please run as root (use sudo)"
  exit
fi

echo "--- Starting System Cleanup ---"

# 1. Cleaning Package Manager Cache (Ubuntu/Debian)
echo "Cleaning APT cache..."
apt-get clean -y

# 2. Removing Temporary Files
echo "Removing system temp files..."
rm -rf /tmp/*

# 3. Clearing System Logs older than 7 days
echo "Cleaning old system logs..."
find /var/log -type f -name "*.log" -mtime +7 -delete

# 4. Emptying all users Trash
echo "Emptying Trash bins..."
rm -rf /home/*/.local/share/Trash/*

echo "--- System is now clean and optimized! ---"
df -h | grep '^/' # Show disk space after cleaning
#END



