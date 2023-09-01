#!/bin/bash
#add fix to exercise4-server1 here
entry="192.168.60.11 server2"

if ! grep -qF "$entry" /etc/hosts; then
    echo "Adding entry to /etc/hosts"
    echo "$entry" | sudo tee -a /etc/hosts > /dev/null
else
    echo "Entry already exists in /etc/hosts"
fi