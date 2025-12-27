#!/bin/bash


Report_file="sys_report_$(date +%Y-%m-%d).txt" 

echo "----system Report ($REPORT_FILE) --- " > $Report_file
echo "Generated at: $(date)" >> $Report_file

echo -e "\n1. RAM Usage:" >> $Report_file
free -h >> $Report_file

echo -e "\n2. Disk Space:" >> $Report_file
df -h | grep '^/dev/' >> Report_file

echo -e "\n3. Top 5 CPU Consuming Processes:" >> $Report_file
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6 >> $Report_file

echo "Report saved to $Report_file"
cat $Report_file

#END
