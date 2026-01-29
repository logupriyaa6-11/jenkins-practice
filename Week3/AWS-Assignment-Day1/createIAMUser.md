# Create Custom IAM role, policy and attach it to IAM user. Also enable MFA for that user

Sign up to an AWS account

# Step 1:
Go to search bar and type "IAM"
![IAM Search] <Week3\AWS-Assignment-Day1\IAM.png>

# Step 2:
In the left side bar click on Users, Create user
![Create user]<Week3\AWS-Assignment-Day1\createUser.png>

1. specify the user details
we can enter the credentials here
![specify user details]<Week3\AWS-Assignment-Day1\specifyUserDetails.png>

2. set permissions
![set permissions]<Week3\AWS-Assignment-Day1\setPermission.png>
here we have 3 options,
- Add user to existing group (use:when the group of users have same role they can be grouped and allowed for similar)

- copy permissions (use:copy permissions from existing users)

- Attach policies directly (use:we have a set of predefined policies, that can be used)

- custom policy attached 
![cutom policy attached]<Week3/AWS-Assignment-Day1/customPolicyAttached.png>

we can choose any one of them from here

3. review and create
![review and create]<Week3\AWS-Assignment-Day1\review&create.png>

This page is a preview page which shows the details which we have entered previously

## Step 3
Enabling MFA 