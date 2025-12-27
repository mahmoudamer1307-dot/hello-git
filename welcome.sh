#!/bin/bash

# Configuration
USER_NAME=$(whoami)
CURRENT_DATE=$(date "+%Y-%m-%d %H:%M:%S")
RAM_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

# The Interface
echo "=========================================="
echo "  Welcome back, $USER_NAME! 👋"
echo "  Current Time: $CURRENT_DATE"
echo "  System RAM Usage: $RAM_USAGE"
echo "=========================================="

# Add a small tip
echo "Tip: Keep your system clean with cleaner.sh"
echo "=========================================="

#END






















