#!/bin/bash

# Ask user to input directory
read -rp "Enter directory to search in (default is current dir): " directory
directory=${directory:-.}  # Use current directory if none given

# Ask user for file extension
read -rp "Enter the file extension (e.g., pdf, txt, jpg): " extension

# Sanitize the extension (remove leading dot if present)
extension="${extension#.}"

# Validate input
if [[ -z "$extension" ]]; then
    echo "No extension entered. Exiting."
    exit 1
fi

# Find files
echo -e "\nSearching for *.$extension files in: $directory"
results=$(find "$directory" -type f -iname "*.$extension")

# Count and display results
count=$(echo "$results" | grep -c .)

if [[ $count -eq 0 ]]; then
    echo "No .$extension files found in $directory."
else
    echo -e "\nFound $count file(s):"
    echo "$results"
fi
