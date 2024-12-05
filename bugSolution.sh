#!/bin/bash

# This script demonstrates a solution to the race condition by using file locking.

# Create a file if it doesn't exist
if [ ! -f myfile.txt ]; then
  touch myfile.txt
fi

# Update the file content in one process with locking
(while true; do
  flock -n 200 myfile.txt || exit 1
  echo "Process 1: "`date` >> myfile.txt
  echo "Process 1: "`date +"%s" >> myfile.txt
  sleep 1
  flock -u 200 myfile.txt
done) &
PID1=$!

# Update the file content in another process with locking
(while true; do
  flock -n 200 myfile.txt || exit 1
  echo "Process 2: "`date` >> myfile.txt
  echo "Process 2: "`date +"%s" >> myfile.txt
  sleep 1
  flock -u 200 myfile.txt
done) &
PID2=$!

# Wait for a keyboard interrupt to stop the processes
wait $PID1 $PID2