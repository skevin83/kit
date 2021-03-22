#/bin/bash
cat >/etc/yum.repos.d/google-chrome.repo <<EOL
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOL
yum update -y && yum install google-chrome-stable -y
