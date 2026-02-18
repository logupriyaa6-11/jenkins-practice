# Launch an On-demand EC2 instance with 7 GB EBS volume attached to it in AP-South-1 region. Configure your security groups such that only people within your InTimeTec network are able to SSH into it.

## STEP 1:
log in as user and select region as ap-south-1

## STEP 2:
In search bar search for EC2 and open the EC2 dashboard 
![EC2 dashboard]<Week3\AWS-Assignment-Day3\EC2Dashboard.png>

In that click launch Instance 

## STEP 3
Name your instance in the name and tag option 
![name the instance]<Week3\AWS-Assignment-Day3\namingInstance.png>

## STEP 4
down there, there is an option to chose the operating system

![choosing OS]<Week3\AWS-Assignment-Day3\choosingAMI.png>

choose Amazon Linux 2023 kernel-6.1 AMI

## STEP 5 
choose instance type => here I've choosen t3.micro as it is available in free tier

create key-pair for securely connecting to your instance (if we don't have any)

![choose instance type and create key-pair]<Week3\AWS-Assignment-Day3\instanceType&Key-pair.png>

## STEP 6
In the network settings panel, choose the vpc that was created 
choose public subnet
enable auto assign public IP
choose create security group in firewall security groups
choose the default name and description or can be altered
In inbound security group rules choose
1. type: ssh
2. source type: My IP 

![NETWORK SETTINGS]<Week3\AWS-Assignment-Day3\networkSettings.png>

## STEP 7
In the config storage panel, choose 8GiB and gp3 as route volume 

## STEP 8
in the right side panel, there is a button to launch the instance, click on that and launch the instance