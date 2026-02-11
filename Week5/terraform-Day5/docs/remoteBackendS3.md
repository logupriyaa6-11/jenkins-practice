# Configure the remote backend in S3 to store the state file for your terraform module

## Backend Architecture
-> When Terraform initializes the working directory, it connects to the specified S3 bucket and configures remote state management

## State Storage Behavior
By default, Terraform stores its state file locally as terraform.tfstate. Once the S3 backend is configured and initialized

- Local state storage is disabled
- The state file is uploaded to the specified S3 bucket
- All future state updates are written directly to S3
- Terraform reads state information from S3 during planning and apply

## Backend Initialization Process
When the backend configuration is present and initialization is performed:
- Terraform detects the backend configuration
- It establishes a connection to the S3 bucket
- If a local state file exists, Terraform migrates it to S3
- A remote state object is created at the defined key path

=> From that point onward, all Terraform operations interact with the remote state instead of local files.

## State object in S3
The state file is stored as an object inside the S3 bucket using the defined key - terraform-Day5/terraform.tfstate

=> Each infrastructure update modifies this object

=> The S3 bucket effectively becomes the centralized storage location for Terraform state

## Infrastructure Lifecycle with Remote Backend
During Terraform operations
1. Terraform reads current state from S3
2. It compares configuration with remote state
3. It determines required changes
4. It updates infrastructure accordingly
5. It writes the updated state back to S3
6. The remote backend ensures that state remains consistent and accessible across environments
