#!/bin/bash
path=$1
START=$(date +%s.%N)
if [ $# != 1 ]; then
    echo Invalid arguments
    exit
fi

if [ ${path: -1} != '/' ]; then
    echo Parametr must end with slash
    exit
fi

if ! [ -d $path ]; then
    echo "This dir doesn't exists"
    exit
fi

echo -e "[x] Total number of folders (including all nested ones) = $(du $path | wc -l)"
echo -e "[x] TOP 5 folders of maximum size arranged in descending order (path and size):\n$(du $path -h | sort -rh | head -5 | awk '{printf "%d - %s, %s\n",NR,$2,$1}' )"
echo -e "[x] Total number of files = $(du $path -a | wc -l)"
echo -e "[x] Number of:\n    Configuration files = $(find $path -name ".conf" | wc -l)\n    Text files = $(find $path -name "*txt" | wc -l)\n   \
 Executable files = $(find $path -perm /a=x | wc -l)\n    Log files = $(find $path -name "   .log" | wc -l)\n    \
Archive files = $(find $path -name "*.zip" -o -name "*.tar" | wc -l)\n    Symbolic links = $(find $path -type l | wc -l)"
echo -e "[x] TOP 10 files of maximum size arranged in descending order (path, size and type): \n\
$(find $path -type f -exec du -h {} \; | sort -rh | head -10 | awk '{printf "%d - %s, %s\n", NR, $2, $1}')"
echo -e "[x] TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)\n\
$(find $path -perm /a=x -exec du -h {} \; | sort -rh | head -10 | awk '{printf "%d - %s, %s\n", NR, $2, $1}')"
END=$(date +%s.%N)
DIFF=$(echo "scale=1; ($END - $START)/1.0" | bc)
echo -e "[x] Script execution time (in seconds) = $DIFF"