#!/bin/bash
set -e

cd ~
mkdir -p awscli-installation
cd awscli-installation

curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

cd ~
rm -rf awscli-installation

echo ""
echo ""
echo ">>>>>>>>>>>> Installation is completed! <<<<<<<<<<<<<"
echo ""
echo ""

aws --version