#!/bin/bash

# LVM & Storage Architect - Automation Tool
# Developed by: Mahmoud Amer

# Important: This script demonstrates LVM workflow
# Run as Root to see actual disk information

if [ "$EUID" -ne 0 ]; then
    echo "Error: Please run as Root to manage storage."
    exit 1
fi

echo "--- Current Physical Disks ---"
lsblk -o NAME,SIZE,TYPE,MOUNTPOINT

echo -e "\n--- LVM Architecture Steps ---"

# Step 1: Physical Volume (PV) creation
# This marks the raw disk to be used by LVM
echo "[1/3] PV Phase: Marking disks as Physical Volumes..."
echo "Command: pvcreate /dev/sdb" # Example disk

# Step 2: Volume Group (VG) creation
# This combines disks into a single pool of storage
echo "[2/3] VG Phase: Creating the storage pool (Volume Group)..."
echo "Command: vgcreate vg_data /dev/sdb"

# Step 3: Logical Volume (LV) creation
# This is where we cut a 'virtual partition' to use
echo "[3/3] LV Phase: Creating Logical Volume (The actual partition)..."
echo "Command: lvcreate -L 10G -n lv_projects vg_data"

echo -e "\n--- Current LVM Status ---"
vgs # Shows Volume Groups
lvs # Shows Logical Volumes
