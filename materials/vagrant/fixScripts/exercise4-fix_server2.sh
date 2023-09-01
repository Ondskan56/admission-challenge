#!/bin/bash
#add fix to exercise4-server2 here
entry="192.168.60.10 server1"

if ! grep -qF "$entry" /etc/hosts; then
    echo "Adding entry to /etc/hosts"
    echo "$entry" | sudo tee -a /etc/hosts > /dev/null
else
    echo "Entry already exists in /etc/hosts"
fi