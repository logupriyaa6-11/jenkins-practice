# Create an EC2 instance in both public and private subnets. The private subnet instance should only be accessible from the public subnet over SSH. Both instances should be able to communicate to the internet.Create Auto Scaling group of EC2 instances and scale in/out based on Average CPU Utilization. Launch a VPC with 2 Subnets (1 Public, 1 Private). Setup budgets alarms

# CREATE VPC AND SUBNETS
## STEP 1 create vpc
Go to VPC -> Create VPC
Choose VPC only
Name: Assignment-VPC
IPv4 CIDR: 10.0.0.0/16
Create VPC

Now the VPC is created

## STEP 2 Create Subnets
Public Subnet

VPC -> Subnets -> Create subnet
VPC: Assignment-VPC
Name: Public-Subnet(Assignment)
AZ: any (e.g. us-east-1a)
CIDR: 10.0.1.0/24
Create

Private Subnet
Create subnet again
Name: Private-Subnet(Assignment)
CIDR: 10.0.2.0/24
Create

# INTERNET ACCESS 
## STEP 1: Create Internet Gateway
VPC -> Internet Gateways -> Create
Name: Assignment-IGW
Attach to Assignment-VPC

## STEP 2: Public route table
VPC -> Route Tables -> Create
Name: Public-RT(Assignment)
VPC: Assignment-VPC

Edit routes
Destination: 0.0.0.0/0
Target: Internet Gateway

Associate
Subnet: Public-Subnet

## STEP 3: NAT Gateway (for private subnet)
VPC -> NAT Gateways -> Create
Subnet: Public-Subnet
Allocate Elastic IP
Create

## STEP 4: Private Route Table

Create Route Table
Name: Private-RT(Assignment)
Add route:
Destination: 0.0.0.0/0
Target: NAT Gateway
Associate with Private-Subnet

# EC2 Instances and Security
## STEP 1: Security Groups
Public EC2 Security Group
EC2 → Security Groups → Create
Name: Public-SG(Assignment)
Inbound:
SSH (22) → Your IP
Outbound: Allow all

Private EC2 Security Group
Only SSH from public EC2
Create SG: Private-SG
Inbound:
SSH (22) → Source: Public-SG
Outbound: Allow all

## STEP 2 Launch Public EC2
EC2 -> Launch instance
Name: Public-EC2(Assignment)
AMI: Amazon Linux
Instance type: t2.micro
Network:
VPC: Assignment-VPC
Subnet: Public-Subnet
Auto-assign Public IP: Enabled
Security group: Public-sg(Assignment)
Key pair: create
Launch

## STEP 3 Launch Private EC2
Launch instance
Name: Private-EC2
Subnet: Private-Subnet
Auto-assign Public IP: Disabled
Security group: Private-SG(Assignment)
Launch

# AUTO SCALING GROUP
## STEP 1 Create Launch Template

EC2 -> Launch Templates -> Create
AMI: Amazon Linux
Instance type: t3.micro
Security Group: Public-SG(Assignment)
Create

## STEP 2 Create Auto Scaling Group
Auto Scaling -> Create ASG
Use Launch Template
VPC: Assignment-VPC
Subnet: Public-Subnet(Assignment)
Desired: 1
Min: 1
Max: 3

![Auto scaling group]<Week3\Weekly-assignment-week03\ASG.png>

Add scaling policy
Type: Target tracking
Metric: Average CPU Utilization
Target value: 50%

![scaling policy]<Week3\Weekly-assignment-week03\AutoScaling.png>

# Budget & Cost Alarm
Billing -> Budgets -> Create
Budget type: Cost
Amount: $10
Period: Monthly
Create budget

![budget and cost alarm]<Week3\Weekly-assignment-week03\budget&Alert.png>