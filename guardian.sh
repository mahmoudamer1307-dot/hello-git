#!/bin/bash

# Guardian Admin Suite - Professional Linux Administration Tool
# Developed by: Mahmoud Amer

# --- Colors ---
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

show_menu() {
    echo -e "${CYAN}--- GUARDIAN ADMIN SUITE ---${NC}"
    echo "1. User Management (Add/Delete/List)"
    echo "2. System Health Check (RAM/CPU/Disk)"
    echo "3. Network Status (IP/Ports)"
    echo "4. Service Control (Check Apache/Nginx)"
    echo "5. Create System Backup"
    echo "6. Exit"
    echo -ne "${GREEN}Choose an option [1-6]: ${NC}"
}

# --- Functional Logic (The Admin Tasks) ---
manage_users() {
    echo "Current Users:"
    cut -d: -f1 /etc/passwd | tail -n 5
}

check_system() {
    echo -e "${GREEN}RAM Usage:${NC}"
    free -h
    echo -e "${GREEN}Disk Space:${NC}"
    df -h
}

# --- Main Loop ---
while true; do
    show_menu
    read choice
    case $choice in
        1) manage_users ;;
        2) check_system ;;
        3) hostname -I ;;
        4) systemctl list-units --type=service --state=running | head -n 10 ;;
        5) tar -cvf backup_$(date +%F).tar ~/Documents/hello-git/ ;;
        6) echo "Goodbye!"; exit ;;
        *) echo -e "${RED}Invalid Choice!${NC}" ;;
    esac
    echo -e "${CYAN}Press Enter to continue...${NC}"
    read
done








