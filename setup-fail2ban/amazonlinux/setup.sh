#!/bin/bash
sudo amazon-linux-extras install -y epel
sudo yum update -y
sudo yum install -y fail2ban
sudo cp jail.local /etc/fail2ban/
sudo systemctl start fail2ban
sudo systemctl enable fail2ban