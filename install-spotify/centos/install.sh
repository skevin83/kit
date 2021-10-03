#!/bin/bash
sudo dnf install -y epel-release
sudo dnf update
sudo yum install -y snapd
sudo systemctl enable --now snapd.socket
sudo systemctl start snapd.socket
sleep 5
sudo rm -f /var/lib/snapd/snap /snap
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install spotify
