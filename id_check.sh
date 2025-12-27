#!/bin/bash

# Identity Lab - Understanding UID vs EUID
# Developed by: Mahmoud Amer

echo "--- Current Process Identity ---"

# Displaying Real UID (The person who launched the script)
echo "Real UID (id -u): $(id -u)"

# Displaying Effective UID (The power level currently held)
echo "Effective UID (\$EUID): $EUID"

# Checking if we have Root Power
if [ "$EUID" -eq 0 ]; then
    echo -e "\nSTATUS: You are running with ROOT privileges! "
else
    echo -e "\nSTATUS: You are a standard user. Limited power. "
fi
#END


