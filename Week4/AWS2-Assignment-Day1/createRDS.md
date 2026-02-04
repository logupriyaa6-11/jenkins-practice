# Create RDS and understand the options related to muti AZ, read replica. 

## Step 1: 
To create database, search for RDS and open Aurora and RDS
In the left side panel we could see the option, Databases

click that and an interface for creating the database will be visible 
click create database

## Step 2:
Fill the credentials

Choose a database creation method: Full configuration 
(Reason: You set all of the configuration options, including ones for availability, security, backups, and maintenance.)

Engine options: 
Engine type: MySQL
(Other engines: Aurora (MySQL Compatible), Aurora (PostgreSQL Compatible), MySQL, PostgreSQL, MariaDB, Oracle, Microsoft SQL Server, IBM Db2)

For learning purpose we can go with MySQL or PostgreSQL 
I've chosen MySQL

Edition: MySQL Community (only one option available for MySQL)

Filters: None

Engine version: MySQL 8.4.7 (default (new version))

Templates:
Sandbox (reason: To develop new applications, test existing applications, or gain hands-on experience with Amazon RDS)

When I choose sandbox it will automatically choose the Single-AZ DB instance deployment (1 instance) in Availability and durability section 

specificaion of Single-AZ DB instance deployment (1 instance):
Creates a single DB instance without standby instances. This setup provides:
99.5% uptime
No data redundancy
No standup

Settings:
DB instance identifier: Devops-database

Credentials settings: 
Master username: admin
Credentials management: self managed
enter Master password and confirm master password
Additional credential settings: Password authentication 

Instance configuration:
Burstable classes (includes t classes)

Instance type:
db.t4g.micro
2 vCPUs
1 GiB RAM
EBS Bandwidth: Up to 2,085 Mbps
Network: Up to 5 Gbps

Storage:
Storage type
General Purpose SSD (gp2)
Baseline performance determined by volume size

Allocated storage
20 GiB
Allocated storage value must be 20 GiB to 6,144 GiB

Additional storage configurations:
disable auto scaling 

Connectivity:
Compute resource: Don’t connect to an EC2 compute resource
Network type: IPv4
Virtual private cloud (VPC): Default
DB subnet group: default
Public access: Yes
VPC SG: create new 
sg name: RDS-Sg
Availability zone: ap-south-1a
db port: 3306

Monitoring: Database Insights - Standard

=> create database
![database created]<Week4\AWS2-Assignment-Day1\dbCreated.png>