# Deploy a static web application on EC2 instance using modularized Terraform code. The backend should be configured in S3

## Modular Design and Resource Abstraction
=> we have 2 reusable modules 
1. Security group module
2. EC2 module
-> The instance is launched inside the default VPC. Since no subnet is specified, AWS automatically selects a default subnet within the default VPC.

## Instance Bootstrapping via User Data
=> Because user_data executes automatically during initialization, the server becomes a functional web server immediately after provisioning without manual configuration.

## Module Dependency Flow
Terraform automatically builds a dependency graph based on variable references.

1. Security Group module creates the web security group
2. The security group ID is exported as output
3. The EC2 module takes this ID
4. Terraform ensures the security group is created before launching the EC2 instance

## Remote Backend Architecture (S3 + DynamoDB)

1. S3 State Storage
=> Instead of storing terraform.tfstate locally, the state file is stored remotely in: s3://devops-terra-bucket-123/week-task/terraform.tfstate

- Collaborative
- Centralized state management

2. State Locking with DynamoDB
=>The backend also integrates with a DynamoDB table for state locking

When Terraform operations are initiated:
- A lock record is created in DynamoDB
- Other concurrent operations are blocked
- Lock is released after operation completes

## Execution flow
When the configuration is applied:

1. Terraform connects to S3 backend
2. State lock is acquired via DynamoDB
3. Security group is created
4. EC2 instance is provisioned
5. User data script executes
6. Apache starts serving the static webpage
7. State file is updated in S3
8. Lock is released