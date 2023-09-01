#!/bin/bash
#add fix to exercise6-fix here
total_bytes_sent=0
path=${@: -1}
hostname=$(hostname)

if [[ $hostname == "server1" ]]; then
    destination="server2:$path"
elif [[ $hostname == "server2" ]]; then
    destination="server1:$path"
else
    echo "Running on some other server: $hostname"
fi

for ((i=1; i<=$#-1; i++))
do
  current_file=${!i}
  bytes_sent=$(scp -o StrictHostKeyChecking=no -v "$current_file" "$destination" 2>&1 | grep "Bytes per second" | awk -F' ' '{print $5}' | tr -d ',')
  total_bytes_sent=$(echo "$total_bytes_sent + $bytes_sent" | bc)
done

echo "$total_bytes_sent"
