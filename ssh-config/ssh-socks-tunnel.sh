#!/bin/bash
ssh -D 30000 -f -C -q -N <your ssh server ip>

# Explanation of arguments
# 
    # -i: The path to the SSH key to be used to connect to the host
    # -D: Tells SSH that we want a SOCKS tunnel on the specified port number (you can choose a number between 1025 and 65536)
    # -f: Forks the process to the background
    # -C: Compresses the data before sending it
    # -q: Uses quiet mode
    # -N: Tells SSH that no command will be sent once the tunnel is up


# To Kill the process
# ps -aax  | grep ssh
# kill -9 (PID)