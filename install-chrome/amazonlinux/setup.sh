#/bin/bash
sudo cat >/etc/yum.repos.d/google-chrome.repo <<EOL
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOL
sudo yum update -y && sudo yum install google-chrome-stable -y
