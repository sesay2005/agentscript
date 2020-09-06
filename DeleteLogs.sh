#!/bin/bash
#Date:Sep-06-2020
#Auhtor:Aruna Bakarr Sesay
#Discription:Delete logfiles 14 days old

echo -e "\nDeleting files 14 days older\n"

find /var/log -name "*.log" -type f -mtime +14 -exec rm -rf {} \;

ecit 0

