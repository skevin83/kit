## Step 1 
Assign the role "AWS-SSM" to the EC2 Instance. The role contain the following policy:

1. CloudWatchAgentAdminPolicy 
2. CloudWatchAgentServerPolicy 
3. AmazonSSMManagedInstanceCore 
4. AmazonSSMDirectoryServiceAccess 

## Step 2

- Go to "System Manager" -> "Instances & Nodes" -> "Inventory" -> "Click here to enable inventory on all instances".

- Click the "Run Command" button.

- Search for and select “AWS-ConfigureAWSPackage”.

- Scroll down, and leave everything as the default value and add “AmazonCloudWatchAgent” for the Name field.

- Select "Choose instances manually".

- Unselect "Enable writing to an S3 bucket".

- Click on "Run" button.

## Step 3

- If you haven't install AWSCLI then go ahead and install it now.

## Step 4

- Go to “/opt/aws/amazon-cloudwatch-agent/etc/”.

- Copy the amazon-cloudwatch-agent.json file into the above directory.

## Step 5

- Create parameter store in AWS Management console if there isn't one. The parameter store can be shared among the instances. Thus, do not need to create multiple same parameter store.

### Below is the AWSCLI Command to create parameter store
~~~
aws ssm put-parameter --name "WindowsAgentConfig" --type "String" --value file:///opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json --overwrite --tier Intelligent-Tiering
~~~

## Step 6

- Start the Cloudwatch Agent by running below command inside Terminal.

~~~
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -s -c ssm:LinuxAgentConfig
~~~

- Verify the SSM-Agent is running by typing the command below.

~~~
sudo systemctl status amazon-ssm-agent
~~~