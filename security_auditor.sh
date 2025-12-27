#!/bin/bash

# Security Auditor - Permissions Management Tool
# Developed by: Mahmoud Amer

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}--- Starting Security Audit ---${NC}"

# 1. Find World-Writable Files (High Risk!)

echo -e "${RED}[!] Checking for world-writable files...${NC}"
find /home/looooky/Documents/hello-git -type f -perm -0002

# 2. Fix Script Permissions 
echo -e "${GREEN}[+] Setting standard permissions (755) for all .sh files...${NC}"
chmod 755 /home/looooky/Documents/hello-git/*.sh

# 3. Secure Private logs 
echo -e "${GREEN}[+] Securing log files (600)...${NC}"
if [ -f "system_health.log" ]; then
    chmod 600 system_health.log
fi

# 4. Report Ownership
echo -e "${YELLOW}[*] Ownership Report:${NC}"
ls -l /home/looooky/Documents/hello-git | awk '{print $3 " owns " $9}'

echo -e "${GREEN}--- Audit Complete! Your files are secured. ---${NC}"
#END



