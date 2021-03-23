#!/bin/bash
# If you are using Amazon Linux 2 AMI
sudo yum install -y amazon-cloudwatch-agent

# Amazon Linux
# curl -O https://s3.ap-northeast-1.amazonaws.com/amazoncloudwatch-agent-ap-northeast-1/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm

# Centos
# curl -O https://s3.ap-northeast-1.amazonaws.com/amazoncloudwatch-agent-ap-northeast-1/centos/amd64/latest/amazon-cloudwatch-agent.rpm

# Ubuntu
# curl -O https://s3.ap-northeast-1.amazonaws.com/amazoncloudwatch-agent-ap-northeast-1/ubuntu/amd64/latest/amazon-cloudwatch-agent.deb 

# AmazonLinux / Centos
# sudo rpm -U ./amazon-cloudwatch-agent.rpm

# Debian / Ubuntu
# sudo dpkg -i -E ./amazon-cloudwatch-agent.deb

# Running Cloudwatch Agent wizard to generate configuration file
# sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard

# Running the Amazon-Cloudwatch-Agent with configuration file in SSM Parameter Store
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c ssm:LinuxAgentConfig

# Running the Amazon-Cloudwatch-Agent with configuration file stored at your server. Replace (configuration-file-path) with the path to your configuration file.
# sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c file:(configuration-file-path)