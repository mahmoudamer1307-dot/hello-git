#!/bin/bash

# Local Network Scanner - Network Admin Tool
# Developed by: Mahmoud Amer

# Get the first 3 octets of your IP (e.g., 192.168.1)
SUBNET=$(hostname -I | awk '{print $1}' | cut -d. -f1-3)

echo "--- Scanning Network: $SUBNET.0/24 ---"

# Loop through IP addresses from 1 to 254
for ip in {1..254}; do
    # Ping each IP once with a 1-second timeout
    ping -c 1 -W 1 $SUBNET.$ip > /dev/null 2>&1
    
    # If ping is successful ($? is 0), the device is UP
    if [ $? -eq 0 ]; then
        echo "Device found: $SUBNET.$ip"
    fi
done

echo "--- Scan Finished ---"





