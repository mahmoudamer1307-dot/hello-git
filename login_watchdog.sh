#!/bin/bash

# Login Watchdog - Security Monitoring Tool
# Developed by: Mahmoud Amer

LOG_REPORT="login_audit_$(date +%F).txt"

echo "==========================================" > $LOG_REPORT
echo "       SYSTEM LOGIN SECURITY AUDIT        " >> $LOG_REPORT
echo "       Generated on: $(date)              " >> $LOG_REPORT
echo "==========================================" >> $LOG_REPORT

# 1. Show the last 10 successful logins
echo -e "\n[+] LAST 10 SUCCESSFUL LOGINS:" >> $LOG_REPORT
last -n 10 >> $LOG_REPORT

# 2. Show failed login attempts (Crucial for Security)
# We look into /var/log/auth.log or use 'faillog'
echo -e "\n[!] FAILED LOGIN ATTEMPTS:" >> $LOG_REPORT
if [ -f /var/log/auth.log ]; then
    grep "Failed password" /var/log/auth.log | tail -n 10 >> $LOG_REPORT
else
    echo "Auth log not found. Checking alternative records..." >> $LOG_REPORT
    journalctl _SYSTEMD_UNIT=ssh.service | grep "Failed" | tail -n 10 >> $LOG_REPORT
fi

# 3. Check currently logged-in users
echo -e "\n[*] CURRENTLY LOGGED-IN USERS:" >> $LOG_REPORT
who >> $LOG_REPORT

echo "Audit complete. Report saved to: $LOG_REPORT"
#END
