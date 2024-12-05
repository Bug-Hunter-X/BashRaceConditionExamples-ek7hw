# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script. Two processes concurrently write to the same file, leading to data corruption and unexpected behavior.

## Bug Description
The `bug.sh` script creates two processes that continuously append timestamps to a file.  Due to the concurrent nature of writing, the output becomes interleaved and can be inconsistent. This is a classic example of a race condition where the final state of the file depends on the unpredictable timing of process execution.

## Solution
The `bugSolution.sh` script addresses the race condition by using file locking to ensure exclusive access to the file by each process at a time. This prevents interleaving and guarantees data integrity. 

## How to reproduce
1. Clone this repository
2. Run the `bug.sh` script in a terminal.  Let it run for some time (e.g., 30 seconds) then press Ctrl+C to stop it.
3. Examine the `myfile.txt` file to observe the interleaved output.
4. Then run `bugSolution.sh` and see the difference. 