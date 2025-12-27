#!/bin/bash

# Simple Calculator Project

echo "------------------------------------"
echo "   Welcome to My Calculator    "
echo "------------------------------------"

# 1. Get input from the user
read -p "Enter first number: " num1
read -p "Enter second number: " num2

# 2. Show options
echo "Choose an operation:"
echo "1. Addition (+)"
echo "2. Subtraction (-)"
echo "3. Multiplication (*)"
echo "4. Division (/)"
read -p "Select option (1-4): " choice

# 3. Calculation Logic
case $choice in
    1) result=$(echo "$num1 + $num2" | bc) ;;
    2) result=$(echo "$num1 - $num2" | bc) ;;
    3) result=$(echo "$num1 * $num2" | bc) ;;
    4) 
        if [ $num2 -eq 0 ]; then
            result="Error: Division by zero!"
        else
            result=$(echo "scale=2; $num1 / $num2" | bc)
        fi
        ;;
    *) echo "Invalid option"; exit ;;
esac

echo "------------------------------------"
echo "The Result is: $result"
echo "------------------------------------"




























