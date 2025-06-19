# linux-file-extension-finder-counter-bash-script
🖥️ A lightweight, interactive Bash script to find and count files by extension in any Linux directory. Perfect for sysadmins, developers, and power users.

# 📂 Find & Count Files by Extension in Linux (Bash Script)

![Poster](https://miro.medium.com/v2/resize:fit:1100/format:webp/0*5fVb0khKkM8Q-yul)
---

## 🚀 Overview

Need a quick way to **find and count files by extension** like `.pdf`, `.txt`, `.log`, etc., in your Linux system? This simple yet powerful **interactive Bash script** helps you:

✅ Prompt for file extension  
✅ Search in any directory (recursively)  
✅ Count and display matching files with full paths

---

## 🧠 Features

- 🗂️ **Custom Directory Input**  
- 🧾 **Flexible Extension Matching (case-insensitive)**  
- 🔍 **Recursive Search with `find`**  
- 📊 **Clean Output: Count + File Paths**

---

## 📜 Script

```bash
#!/bin/bash

read -rp "Enter directory to search in (default is current dir): " directory
directory=${directory:-.}

read -rp "Enter the file extension (e.g., pdf, txt, jpg): " extension
extension="${extension#.}"

if [[ -z "$extension" ]]; then
    echo "No extension entered. Exiting."
    exit 1
fi

echo -e "\nSearching for *.$extension files in: $directory"
results=$(find "$directory" -type f -iname "*.$extension")

count=$(echo "$results" | grep -c .)

if [[ $count -eq 0 ]]; then
    echo "No .$extension files found in $directory."
else
    echo -e "\nFound $count file(s):"
    echo "$results"
fi

