#!/bin/bash
rm -f /home/<your user folder>/.ssh/known_hosts

# Add below line to your crontab
# */5 * * * * /home/<your user folder>/.ssh/clear_known_host.sh >/dev/null 2>&1