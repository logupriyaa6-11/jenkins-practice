# Create a Lambda function in Python that automatically copies images from the source  S3 bucket to the destination S3 bucket as soon as they gets uploaded in the source bucket.

# Step 1: 
create 2 S3 buckets in same zone

![S3 buckets]<Week4\AWS2-Assignment-Day2\createdS3Buckets.png>

# Step 2:
Go to IAM->Roles->create role

Trusted entity: AWS service
Use case: Lambda

Attach the policies:
s3:PutObject(writing)
s3:GetObject(reading)
CloudWatchLogsFullAccess

Role name: lambda-s3-copy-role

![Lambda role]<Week4\AWS2-Assignment-Day2\lambdaRoleCreation.png>

# Step 3:
Go to lambda-> create function

Create function: Author from scratch
Function name: copy-image-123-devops
Runtime: Python 3.10
Architecture: x86_64
Permissions :
Execution role: Use an existing role
Existing role: lambda-s3-copy-role
click on create function 
![Lambda function]<Week4\AWS2-Assignment-Day2\createdLambdaFunction.png>

# Step 4:
In the created function we could see a code option replace the existing code with the following python code 

```
import json
import boto3
import urllib.parse

s3 = boto3.client('s3')

DESTINATION_BUCKET = "destination-bucket-image-copy-123-devops"

def lambda_handler(event, context):
    source_bucket = event['Records'][0]['s3']['bucket']['name']

    object_key = urllib.parse.unquote_plus(
        event['Records'][0]['s3']['object']['key']
    )

    if not object_key.lower().endswith(('.png', '.jpg', '.jpeg', '.gif')):
        return {
            'statusCode': 200,
            'body': 'Not an image file'
        }

    copy_source = {
        'Bucket': source_bucket,
        'Key': object_key
    }

    s3.copy_object(
        CopySource=copy_source,
        Bucket=DESTINATION_BUCKET,
        Key=object_key
    )

    return {
        'statusCode': 200,
        'body': 'Image copied successfully'
    }
```
=> click deploy 

![lambda code]<Week4\AWS2-Assignment-Day2\deployLambdaCode.png>

# Step 5:
Go to s3 buckets->choose the source bucket for copying the image
click properties and add create the event notification 

Event name: image-upload-trigger
Event types: put
Destination: Lambda function
select from existing 
choose copy-image-123-devops
=>Save

![Event creation]<Week4\AWS2-Assignment-Day2\eventTrigger.png>

# Step 6:
Upload an image from s3 source bucket and try to view it in destination bucket 
![Verfication successful]<Week4\AWS2-Assignment-Day2\verifyDestinationBucket.png>