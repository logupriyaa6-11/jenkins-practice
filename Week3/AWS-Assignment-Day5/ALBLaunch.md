# Launch an ALB in AP-South-1 region and load balance the traffic to 2 EC2 instances.

## STEP 1 Creating EC2 security groups
To create EC2 security groups, from AWS console, go to EC2-> in the left menu click security groups

![create security groups]<Week3\AWS-Assignment-Day5\securityGroups.png>

Click create group and enter the details
Security group name - ec2-web-sg
Description - Security group for EC2 behind ALB
VPC - default

Inbound rules
type 1-name - ssh 
source - My IP

type 2-name - HTTP
source - Anywhere-IPv4

Outbound rules
type - all traffic 
destination - Anywhere-IPv4
click on create security groups and the group is created now

## STEP 2 Creating EC2 Instances

In EC2 service, go to the option Instance and create a instance
repeate the same step again
![EC2 Instance]<Week3\AWS-Assignment-Day5\launchInstance-1.png>

Now, we have 2 instances
![Instances]<Week3\AWS-Assignment-Day5\EC2Instances.png>

## STEP 3 Create Target group

Go to EC2 → Target Groups
Click Create target group

Choose:
Target type: Instances
Protocol: HTTP
Port: 80
VPC: Same as EC2
Click Next

Register targets:
Select both EC2 instances
Click Include as pending
Click Create target group

![Target group]<Week3\AWS-Assignment-Day5\createTargetGroup.png>

## STEP 4 Create the Application Load Balancer

Go to EC2 → Load Balancers
Click Create Load Balancer
Choose Application Load Balancer

Basic Configuration
Name: devops-alb
Scheme: Internet-facing
IP address type: IPv4

Network Mapping
VPC: Same VPC
Availability Zones:
Select at least 2 subnets

Security Group
Create or select a SG that allows:
HTTP (80) from 0.0.0.0/0

![ELB]<Week3\AWS-Assignment-Day5\ELB.png>

## STEP 5 Configure Listener & Routing

Listener:
Protocol: HTTP
Port: 80

Default action:
Forward to -> your target group
Click Create Load Balancer

## STEP 6 Verify Load Balancing

Check status:
ALB status = Active
Target group health = Healthy