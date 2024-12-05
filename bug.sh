#!/bin/bash

# This script demonstrates a race condition bug.

# Create a file if it doesn't exist
if [ ! -f myfile.txt ]; then
  touch myfile.txt
fi

# Update the file content in one process
(while true; do
  echo "Process 1: "`date` >> myfile.txt
  sleep 1
done) &
PID1=$!

# Update the file content in another process
(while true; do
  echo "Process 2: "`date` >> myfile.txt
  sleep 1
done) &
PID2=$!

# Wait for a keyboard interrupt to stop the processes
wait $PID1 $PID2