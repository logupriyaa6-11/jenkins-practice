# Create a S3 bucket with versioning enabled for the objects. Map out a bucket policy such that every object we put within the bucket needs to be encrypted by default using KMS keys.

## STEP 1
In the console page search S3 using the search bar 
click and open S3 

![S3 dashboard]<Week3\AWS-Assignment-Day4\Task01\s3Dashboard.png>

## STEP 2
In that interface, there is a button to create bucket 
click that 

![create bucket]<Week3\AWS-Assignment-Day4\Task01\createBucket.png>

1. select the bucket type: General purpose
2. bucket name:devops-priya-28-1-26 (the bucket name should be unique)
3. object ownership: ACLs disabled  
4. Block Public Access settings for this bucket: Block all public access
5. Bucket versioning: Enable (can be edited later) [ensures that the versioning is enabled for the onjects]
6. default encryption: Server-side encryption with AWS Key Management Service keys (SSE-KMS) [ensure that the object we put in the bucket will be encrypted by default using KMS keys]
7. AWS KMS Key: Choose from your AWS KMS keys 
    From the drop down we can choose the AWS KMS key if already available 
    else create AWS KMS key with the option near the drop down 
    ## creating KMS key
    ### STEP 1: CONFIGURE KEY
        key type: Symmetric
        key usage: Encrypt and decrypt
        click on next
    ### STEP 2: ADD LABELS
        Alias: display name for the key
        description and tags are optional
    ### STEP 3: Define key administrative permissions
        Choose Key administrators and key deletion (optional)
    ### STEP 4: Define key usage permissions
        Choose key users (optional)
    ### STEP 5: Edit key policy
        There will be a predefined policy script, can either modify or leave as it is
    ### STEP 6: Review
        The specification that wa given in the previous steps are listed here, we can edit if required
    By clicking Finish button the Key is created 
    ![create KMS]<Week3\AWS-Assignment-Day4\Task01\KMSSteps.png>

    After this step the created key will be listed in the Available AWS KMS Keys drop down, choose from that
8. bucket key:Enable

click on create bucket button and the buck is created