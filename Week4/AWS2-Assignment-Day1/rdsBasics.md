# Create RDS and understand the options related to muti AZ, read replica. Understand private and public db connection

## What is Amazon RDS?
RDS is a fully managed web service that makes it easy to set up, operate and scale RDB (relational database) in cloud 
 why it is needed?
    Amazon RDS is like a caretaker for your database.
        If database breaks -> RDS fixes it automatically
        If database goes down -> RDS switches to another one
        If data is deleted by mistake -> RDS restores it
        If storage is full -> RDS handles it
    You don’t touch servers or OS.
RDS keeps a backup database ready and switches automatically so your app never stops.

## Supported engines:
MySQL
PostgreSQL
MariaDB
Oracle
SQL Server
Aurora (2- MySQL, PostgreSQL)

## Shared responsibility Model
AWS secures the infrastructure and the customer secures their data, access, and applications running on it.
AWS - security of the cloud
Customer - security in the cloud

## Difference between EC2-hosted database and Amazon RDS
In RDS, database failure is handled automatically using a standby instance, whereas in EC2-hosted databases, failure recovery is manual and causes downtime.

## Control plane vs data plane 
Control plane is responsible for managing and configuring cloud resources, such as creating instances, setting permissions, and defining policies.
Data plane is responsible for handling actual user traffic and data, such as application requests, database queries, and file transfers.

## Multi-AZ (Multi- availability zone)
Aws create 2 zones 
- primary resource in AZ 1
- standby resource in AZ 2
Data is kept in sync
if AZ 1 (primary resource) fails, automatically it switches to AZ 2

## Synchronous replication
Synchronous replication means dta is written to both primary and standby database at the same time before confriming the write 

## public vs private database
public - Anyone on the internet can reach the database (if they have credentials)
private - Database is accessible only inside the cloud network (VPC)

PUBLIC DB
Internet -> Database

PRIVATE DB
Internet -> denied
Application (EC2) -> Database