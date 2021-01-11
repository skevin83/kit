#!/bin/bash
sudo yum update -y && sudo yum upgrade -y
sudo yum install -y git
sudo yum install -y docker || sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
echo ""
echo ""
echo ">>>>>>>>>>>> Installation is completed! <<<<<<<<<<<<<"
echo ""
echo ""
docker --version
docker-compose --version