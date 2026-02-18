# Create another s3 bucket in another account with similar configuration and implement cross account replication between both buckets.

### Create a S3 bucket with the same specification as like source in 2 different account

Account A
Source bucket: source-bucket-123-devops
Encryption: SSE-KMS (Customer-managed CMK)
IAM role: s3-replication-role

Account B
Destination bucket: destination-bucket-123-devops
Encryption: SSE-S3 (AES-256)

## STEP 1: Create Source S3 Bucket (Account A)

Go to S3 -> Create bucket

Configure:
Bucket name: source-bucket-123-devops
Region: ap-south-1
Block public access: Enabled
Bucket versioning: Enabled
Under Default encryption:
Encryption type: SSE-KMS
KMS key: Customer-managed key

## Step 2: Create Customer-Managed KMS Key (Account A)

Go to KMS -> Customer managed keys
Create a symmetric encryption key

Assign alias:
key-devops-2026-priya
Enable key rotation

## Step 3: Update KMS Key Policy (Account A)

{
  "Sid": "AllowS3ReplicationRoleToUseKey",
  "Effect": "Allow",
  "Principal": {
    "AWS": "arn:aws:iam::760659115753:role/s3-replication-role"
  },
  "Action": [
    "kms:Decrypt",
    "kms:DescribeKey",
    "kms:GenerateDataKey*",
    "kms:CreateGrant"
  ],
  "Resource": "*"
}

## Step 4: Create Destination S3 Bucket (Account B)

Login to Account B

Go to S3 -> Create bucket

Configure:
Bucket name: destination-bucket-123-devops
Region: Same as source
Block public access: Enabled
Bucket versioning: Enabled

Default encryption:
SSE-S3 (AES-256)

## Step 5: Create IAM Replication Role (Account A)

Go to IAM -> Roles -> Create role

Trusted entity:
AWS service
Use case: S3 Replication
Role name: s3-replication-role

Trust Relationship
{
  "Effect": "Allow",
  "Principal": {
    "Service": "s3.amazonaws.com"
  },
  "Action": "sts:AssumeRole"
}

## Step 6: Attach Inline IAM Policy to Replication Role (Account A)
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowReadSourceBucketConfig",
      "Effect": "Allow",
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Resource": "arn:aws:s3:::source-bucket-123-devops"
    },
    {
      "Sid": "AllowReadSourceObjectVersions",
      "Effect": "Allow",
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetObjectVersionForReplication",
        "s3:GetObjectVersionAcl",
        "s3:GetObjectVersionTagging"
      ],
      "Resource": "arn:aws:s3:::source-bucket-123-devops/*"
    },
    {
      "Sid": "AllowWriteToDestinationBucket",
      "Effect": "Allow",
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],
      "Resource": "arn:aws:s3:::destination-bucket-123-devops/*"
    }
  ]
}

## Step 7: Add Destination Bucket Policy (Account B)
Allow the replication role from Account A to write objects.
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowReplicationFromSourceAccount",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::760659115753:role/s3-replication-role"
      },
      "Action": [
        "s3:ReplicateObject",
        "s3:ReplicateDelete",
        "s3:ReplicateTags"
      ],
      "Resource": "arn:aws:s3:::destination-bucket-123-devops/*"
    }
  ]
}

## Step 8: Configure Replication Rule (Account A)
Go to S3 → source-bucket-123-devops

Open Management → Replication rules

Create rule:
Rule name: cross-account-replication
Status: Enabled
Scope: All objects

Destination:
Bucket: destination-bucket-123-devops
Account: 644366177178
IAM role: s3-replication-role

Encryption:
Enable Replicate SSE-KMS encrypted objects
Destination encryption: SSE-S3

## Step 9: Validation
Upload a new object to source-bucket-123-devops

Verify:
Object appears in destination bucket

![Object from source]<Week3\AWS-Assignment-Day4\Task02\sourceBucketWithFiles.png>

![Object visible in destination]<Week3\AWS-Assignment-Day4\Task02\destinationBucketWithFiles.png>