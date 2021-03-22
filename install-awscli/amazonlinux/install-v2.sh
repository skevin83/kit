#!/bin/bash
set -e

cd ~
mkdir -p awscli-installation
cd awscli-installation

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

cd ~
rm -rf awscli-installation

echo ""
echo ""
echo ">>>>>>>>>>>> Installation is completed! <<<<<<<<<<<<<"
echo ""
echo ""

aws --version