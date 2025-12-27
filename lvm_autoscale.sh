#!/bin/bash

# LVM Auto-Expander - Automated Storage Scaling
# Developed by: Mahmoud Amer

# Target Partition and Volume Group
TARGET_LV="/dev/mapper/vg_data-lv_projects"
VG_NAME="vg_data"
LV_NAME="lv_projects"
THRESHOLD=90

# 1. Check current usage percentage
USAGE=$(df -h | grep "$TARGET_LV" | awk '{print $5}' | sed 's/%//')

if [ -z "$USAGE" ]; then
    echo "Error: Partition $TARGET_LV not found!"
    exit 1
fi

echo "Current usage for $LV_NAME is $USAGE%"

# 2. Logic to expand if threshold is reached
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Threshold exceeded! Attempting to expand storage..."
    
    # Increase LV size by 2 Gigabytes
    # -r flag automatically resizes the underlying file system (resize2fs/xfs_growfs)
    sudo lvextend -L +2G -r $TARGET_LV
    
    if [ $? -eq 0 ]; then
        echo "Successfully expanded $LV_NAME by 2GB."
    else
        echo "Failed to expand. Check if Volume Group has enough free space (vgs)."
    fi
else
    echo "Storage is within safe limits ($USAGE%). No action needed."
fi
#END
