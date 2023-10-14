#!/bin/bash

start="$(date +%s.%N)"
link=$1

echo -ne "$2Total number of folders (including all nested ones) = $3"
echo $(sudo find $link -type d | wc -l)
echo

echo -e "$2TOP 5 folders of maximum size arranged in descending order (path and size): $3"
sudo du -h $1 | sort -hr | cat -n | head -5 | awk  '{printf $1 " - " $3 ", " $2 "\n"}'
echo

echo -ne "$2Total number of files = $3"
echo $(sudo find $link -type f | wc -l)
echo

echo -ne "$2Configuration files (with the .conf extension) = $3"
echo "$(sudo find $link -name "*.conf" | wc -l)"
echo

echo -ne "$2Text files = $3"
echo $(sudo find $link -name "*.txt" | wc -l)
echo

echo -ne "$2Executable files = $3"
echo $(sudo find $link -executable -type f | wc -l)
echo

echo -ne "$2Log files (with the extension .log) = $3"
echo $(sudo find $link -name "*.log" | wc -l)
echo

echo -ne "$2Archive files = $3"
echo $(sudo find -name "*.tar" | wc -l)
echo

echo -ne "$2Symbolic links = $3"
echo $(sudo find $link -type l | wc -l)
echo

files="$(sudo find $link -type f -exec du -h {} + | sort -hr | head -10 | cat -n)"
echo -e "$2TOP 10 files of maximum size arranged in descending order (path, size and type): $3"
while read line;
do
        num=$(echo "$line" | awk '{print $1}')
        size=$(echo "$line" | awk '{print $2}')
        file=$(echo "$line" | awk '{print $3}')
        extension="${file##*.}"
        echo "$num - $file, $size, $extension"
done <<< "$files"
echo

echo -e "$2TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file): $3"
while read line; 
do
  num=$(echo "$line" | awk '{print $1}')
  size=$(echo "$line" | awk '{print $2}')
  file=$(echo "$line" | awk '{print $3}')
  hash=$(echo "$(sudo md5sum ${file} | awk '{print $1}')")
  echo "$num - $file, $size, $hash"
done <<< "$files"
echo