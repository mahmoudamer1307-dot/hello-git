#!/bin/bash

# The Stealth Diary Vault
# Developed by: Mahmoud Amer

# 1. Variables (from your notes)
SECRET_PASS="mahmoud123"
DIARY_FILE=".my_secret_notes.txt" # hidden file

echo "--- 🛡️ SECURE SYSTEM ACCESS ---"
read -sp "Enter Access Key: " user_pass
echo ""

# 2. Logic (The If-Statement from your notes)
if [ "$user_pass" == "$SECRET_PASS" ]; then
    echo "Welcome back, Master Mahmoud! Opening your notes..."
    sleep 1
    # Check if file exists, if not create it
    if [ ! -f $DIARY_FILE ]; then
        touch $DIARY_FILE
        chmod 600 $DIARY_FILE # Only you can read/write (Permissions)
    fi
    vim $DIARY_FILE
else
    # 3. Creative Security Action
    echo "❌ ACCESS DENIED!"
    echo "Intruder Alert: Attempt logged at $(date)" >> intruders.log
    echo "Your IP: $(hostname -I) has been flagged."
    
    # Simple Prank: Wait 3 seconds and pretend to self-destruct
    echo "System Lockdown in 3..."
    sleep 1
    echo "2..."
    sleep 1
    echo "1..."
    echo "Goodbye! 👋"
    exit 1
fi


