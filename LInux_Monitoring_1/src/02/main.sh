#!/bin/bash
. ../lib/func.sh

output
echo -e "\nDO you want to save info in file?[Y/N]"
read answer

if [ "$answer" == "y" ] || [ "$answer" == "Y" ];  then
exec 1>$filename
output
fi