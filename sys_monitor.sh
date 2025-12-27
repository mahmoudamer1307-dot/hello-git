#!/bin/bash

# 1. Define where to save our logs
LOG_FILE="/home/looooky/Documents/hello-git/system_health.log"

# 2. Get the current date and time
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# 3. Get System Stats
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')

# 4. Write to the Log File
echo "[$TIMESTAMP] CPU: $CPU_LOAD% | RAM: $MEM_USAGE% | DISK: $DISK_USAGE%" >> $LOG_FILE

# 5. Take Action if RAM is high (> 80%)
if (( $(echo "$MEM_USAGE > 80" | bc -l) )); then
    notify-send "🚀 System Alert" "RAM is very high: $MEM_USAGE%"
    echo "[$TIMESTAMP] ALERT: High RAM usage detected!" >> $LOG_FILE
fi

























