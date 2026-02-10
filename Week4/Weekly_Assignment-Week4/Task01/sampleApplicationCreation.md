# Deploy a sample application on EC2 instance that should store data on RDS. Use AWS secrets manager for storing the connection strings

## Step 1: 
Open RDS → Create database
Choose: Standard create
Engine: MySQL
Version: default

Templates
Select: Free tier

Settings
DB instance identifier: sample-db
Master username: admin
Password: ******

Connectivity
VPC: default
Public access: No
VPC security group:
Create new
Name: sample-db-week4-security-grp

## Step 2:
Open Secrets Manager -> Store a new secret
Secret type: Credentials for RDS database
Username: admin
Password: (same as RDS)

Database
Select your RDS instance sample-db-week4

Secret name
sample-db-week4/rds/credentials

Finish -> Store secret

## Step 3:
EC2 -> Launch instance
Name: sample-ec2
AMI: Amazon Linux 2
Instance type: t2.micro
Key pair: 

Network settings
Allow SSH (22) from My IP
Allow HTTP (80) from Anywhere

launch instance

## STEP 4: Allow EC2 to Access RDS
Modify RDS Security Group
Go to security groups
Add inbound rule:
Type: MySQL/Aurora
Port: 3306
Source: EC2 security group

## Step 5: 
Create IAM Role
IAM -> Roles -> Create role
Use case: EC2
Permission:
SecretsManagerReadWrite

Attach role to EC2
EC2 -> Actions -> Security -> Modify IAM role
Attach the role

## Step 6:
Connect to EC2
ssh -i w4-key.pem ec2-user@13.232.124.16
Once inside, update packages:
sudo yum update -y

![connected ec2]<Week4\Weekly_Assignment-Week4\Task01\connectingEC2 .png>

## Step 7: 
Install Required Packages on EC2
  sudo yum update -y
  sudo yum install python3 git -y
Create and Activate Python Virtual Environment
  python3 -m venv venv
  source venv/bin/activate
Install Application Dependencies
 pip install flask flask_sqlalchemy pymysql boto3 cryptography
Application Files
  app.py
    Fetches database credentials from AWS Secrets Manager
    Connects to RDS MySQL using SQLAlchemy
    Defines the database model
    Serves data through a Flask route
  init_db.py
    Creates database tables
    Inserts initial sample data into RDS
Initialize Database and Insert Data
  python init_db.py
Start the Flask Application
  Run the Flask application on port 80 using the virtual environment Python interpreter:
  sudo /home/ec2-user/venv/bin/python app.py

DB Structure:
![flaskapp DB]<Week4\Weekly_Assignment-Week4\Task01\flaskappDB.png>
output:
![connection successfull]<Week4\Weekly_Assignment-Week4\Task01\dbConnectionOutput.png>