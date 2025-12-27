#!/bin/bash

# Sys-Sentinel Dashboard - Real-time Monitoring Tool
# Developed by: Mahmoud Amer

# Color Variables
GREEN='\033[0;32m'
RED='\033[0;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Check for Root Privileges using EUID
check_admin() {
    if [ "$EUID" -eq 0 ]; then
        echo -e "${GREEN}[ADMIN MODE]${NC}"
    else
        echo -e "${RED}[USER MODE - Limited Info]${NC}"
    fi
}

# Main Loop for Real-time update
while true; do
    clear
    echo -e "${CYAN}===================================================="
    echo -e "       SYS-SENTINEL DASHBOARD - v1.0"
    echo -e "       Updated at: $(date +%H:%M:%S)"
    echo -e "====================================================${NC}"

    # 1. Admin & User Info
    echo -e "${YELLOW}[ IDENTITY ]${NC}"
    echo -n "Active Power: " ; check_admin
    echo "Current User: $(whoami) (UID: $(id -u))"

    # 2. System Resources
    echo -e "\n${YELLOW}[ RESOURCES ]${NC}"
    echo -e "RAM Usage: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
    echo -e "CPU Load:  $(uptime | awk -F'load average:' '{ print $2 }')"

    # 3. Storage Health
    echo -e "\n${YELLOW}[ STORAGE ]${NC}"
    df -h | grep '^/' | awk '{ print $1 ": " $5 " used (" $4 " free)" }'

    # 4. Networking
    echo -e "\n${YELLOW}[ NETWORK ]${NC}"
    echo "Local IP: $(hostname -I | awk '{print $1}')"
    echo "Active Connections: $(ss -tun | grep ESTAB | wc -l)"

    # 5. Top 3 Processes (Memory Hungry)
    echo -e "\n${YELLOW}[ TOP PROCESSES ]${NC}"
    ps -eo comm,%mem --sort=-%mem | head -n 4

    echo -e "${CYAN}====================================================${NC}"
    echo "Press [CTRL+C] to stop monitoring..."
    sleep 2
done
#END
