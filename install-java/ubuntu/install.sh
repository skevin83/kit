#!/bin/bash
# REFER OFFICIAL DOCUMENTATION https://adoptopenjdk.net/installation.html#x64_linux-jdk
sudo apt-get install -y wget apt-transport-https gnupg
wget https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public
gpg --no-default-keyring --keyring ./adoptopenjdk-keyring.gpg --import public
gpg --no-default-keyring --keyring ./adoptopenjdk-keyring.gpg --export --output adoptopenjdk-archive-keyring.gpg
rm adoptopenjdk-keyring.gpg public adoptopenjdk-keyring.gpg~
sudo mv adoptopenjdk-archive-keyring.gpg /usr/share/keyrings
echo "deb [signed-by=/usr/share/keyrings/adoptopenjdk-archive-keyring.gpg] https://adoptopenjdk.jfrog.io/adoptopenjdk/deb hirsute main" | sudo tee /etc/apt/sources.list.d/adoptopenjdk.list
sudo apt-get update
sudo apt-get install -y adoptopenjdk-11-hotspot
