#!/bin/bash

# Storage AI-Butler - Smart Data Tiering Tool
# Developed by: Mahmoud Amer

SOURCE_DIR="/home/looooky/Documents/projects"
ARCHIVE_VG="/dev/mapper/vg_data-lv_archive"
ARCHIVE_MOUNT="/mnt/archive"
DAYS_THRESHOLD=30

echo -e "--- 🤖 Storage Butler is Analyzing Your Data ---"

# 1. Ensure Archive partition is mounted
if ! mountpoint -q $ARCHIVE_MOUNT; then
    echo "[!] Archive storage not found. Mounting now..."
    sudo mount $ARCHIVE_VG $ARCHIVE_MOUNT
fi

# 2. Find "Cold Data" 
# Files larger than 50MB that haven't been accessed in 30 days
echo "Searching for 'Cold Data' (Files > 50MB, Unused for $DAYS_THRESHOLD days)..."



find $SOURCE_DIR -type f -size +50M -atime +$DAYS_THRESHOLD | while read -r file; do
    FILENAME=$(basename "$file")
    echo "Found cold file: $FILENAME. Archiving..."

    # 3. Compress and Move to LVM Archive
    # Using 'tar' for archiving to the LVM mount point
    tar -czf "$ARCHIVE_MOUNT/${FILENAME}_$(date +%F).tar.gz" "$file" --remove-files
    
    if [ $? -eq 0 ]; then
        echo "Successfully archived $FILENAME to LVM storage."
        # 4. Create a 'Symlink' so the user still sees the file location
        ln -s "$ARCHIVE_MOUNT/${FILENAME}_$(date +%F).tar.gz" "${file}.archived"
        echo "Created a shortcut link in the original folder."
    fi
done

echo "--- 🤖 Butler Job Finished. Your main disk is breathing again! ---"
