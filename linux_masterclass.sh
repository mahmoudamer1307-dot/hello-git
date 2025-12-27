#!/bin/bash

# ==========================================================
# Script Name: Linux Admin Masterclass
# Developed by: Mahmoud Amer (Based on Linux Admin 1.2 Summary)
# Purpose: Interactive Teaching Tool for Linux Fundamentals
# ==========================================================

# Colors for presentation
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

clear
echo -e "${CYAN}Welcome to Mahmoud's Linux Masterclass!${NC}"
echo "------------------------------------------------"

# --- SECTION 1: INTRO & HISTORY ---
echo -e "${YELLOW}[1] Intro & Linux History${NC}"
echo "Linux was born in 1991. It is Open Source (GPL License)."
echo "Software Layers: Hardware -> Kernel -> Shell -> Terminal."
echo "Current OS Identity: GNU/Linux."
sleep 2

# --- SECTION 2: BASIC COMMANDS & IDENTITY ---
echo -e "\n${YELLOW}[2] Identity & Basic Navigation${NC}"
echo "Who am I? $(whoami) (UID: $EUID)"
echo "Root UID is always 0."
echo "Current Path: $(pwd)"
echo "Displaying Date: $(date +%R)"
sleep 3

# --- SECTION 3: FILE SYSTEM HIERARCHY ---
echo -e "\n${YELLOW}[3] File System Hierarchy (The Inverted Tree)${NC}" 
echo "/root: Root's home | /home: Users' home | /etc: Config files"
echo "/bin: Commands | /var: Logs & Variables | /tmp: Temporary files"
sleep 4

# --- SECTION 4: USER & GROUP MANAGEMENT ---
echo -e "\n${YELLOW}[4] Managing Users & Security${NC}"
echo "Users database: /etc/passwd | Groups database: /etc/group"
echo "To add a user: useradd -m -s /bin/bash username"
echo "To modify permissions: chmod (Symbolic: u+x | Octal: 755)"
echo "Ownership: chown user:group filename"
sleep 5

# --- SECTION 5: ADVANCED STORAGE (LVM & RAID) ---
echo -e "\n${YELLOW}[5] Advanced Storage (The Core of Admin Work)${NC}"
echo "RAID Levels: RAID 0 (Striping), RAID 1 (Mirroring), RAID 5 (Parity)."
echo "LVM Layers: PV (Physical) -> VG (Group) -> LV (Logical)." 
echo "LVM allows Online Resizing (lvextend -r)."
sleep 6

# --- SECTION 6: PROCESSES & SERVICES ---
echo -e "\n${YELLOW}[6] Processes & Systemd Services${NC}"
echo "Process status: ps -aux | Monitoring: top"
echo "Process Priority (Nice): -20 (Highest) to 19 (Lowest)."
echo "Service Control: systemctl start/stop/enable/status service_name"
sleep 7

# --- SECTION 7: NETWORKING & SSH ---
echo -e "\n${YELLOW}[7] Networking & Secure Access${NC}"
echo "Check IP: ip address show | Check Connections: ss -tulpn"
echo "SSH Handshake: Client & Server agree on encryption."
echo "Port 22 is the default for SSH."
sleep 8

echo -e "\n${GREEN}--- MASTERCLASS COMPLETE ---${NC}"
echo "Check /var/log for logs and /etc/fstab for storage mounts."

#END

