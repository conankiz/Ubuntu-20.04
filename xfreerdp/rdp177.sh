#!/bin/bash
# Read Password
read -t 10 -sp "Enter Password: " passwd

echo -n Type your username:  
read  username
echo -n Type your Password: 
read -s password
echo
# Run Command
sudo xfreerdp /f /v:192.168.11.177 /d:tic.local /u:$username /p:$password

