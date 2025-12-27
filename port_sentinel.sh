#!/bin/bash

# Port Sentinel - Security Scanning Tool
# Developed by: Mahmoud Amer

TARGET="127.0.0.1" # Scanning your own machine
PORTS=(21 22 80 443 3306 8080)

echo "--- Security Audit for $TARGET ---"
echo "Checking common service ports..."

for port in "${PORTS[@]}"; do
    # Using timeout to avoid hanging
    # 2>/dev/null hides the connection errors
    (echo > /dev/tcp/$TARGET/$port) > /dev/null 2>&1
    
    if [ $? -eq 0 ]; then
        echo -e "[!] Port $port: OPEN (Potential Risk if not needed)"
    else
        echo -e "[✓] Port $port: CLOSED"
    fi
done

echo "--- Scan Complete ---"
#END



