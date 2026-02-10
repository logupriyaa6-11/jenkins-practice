# Create a VPC in AWS. Create a public and private subnet in it.

## STEP 1:
Go to services 
Click VPC
![vpc]<Week3\AWS-Assignment-Day2\VPC.png>

At the top left portion, there is a option know as Create VPC
click and enter the details
![create VPC]<Week3\AWS-Assignment-Day2\createVPC.png>

After that click create VPC and then the VPC is created

## STEP 2
In the left side bar of VPC, there is an option subnet
click that and the page to create subnet will be visible
In the top right corner, there is an option create subnet
click and enter the details
![create subnet]<Week3\AWS-Assignment-Day2\createSubnets.png>

After that click create subnet and then the subnet is created

This is for public subnet

## STEP 3
In the left side bar of VPC, there is an option subnet
click that and the page to create subnet will be visible
In the top right corner, there is an option create subnet
click and enter the details
![create subnet]<Week3\AWS-Assignment-Day2\createSubnets.png>

After that click create subnet and then the subnet is created

This is for private subnet

## STEP 4
In the left side bar of VPC, there is an option Internet Gateway
click that and the page to create Internet gateway will be visible
In the top right corner, there is an option create Internet gateway
click and enter the details

![Internet Gateway]<Week3\AWS-Assignment-Day2\internetGateway.png>

After that click create INternet Gateway and then the internet gateway is created

## STEP 5
After creating the Internet gateway, there will be a pop up message to attach VPC to internet gateway

![Attach VPC to IGW]<Week3\AWS-Assignment-Day2\linkVPCtoIGW.png>
Select the VPC to attach and proceed by clicking Attach VPC

## STEP 6
After attaching the VPC to IGW, go to the route table in the left side bar 

![Route table]<Week3\AWS-Assignment-Day2\createRouteTable.png>
Enter the details 

## STEP 7
Open route, in the top right there is a drop down choose edit route from that

![Edit route]<Week3\AWS-Assignment-Day2\editRoutes.png>

Add a route with target as 0.0.0.0/0 and target as internet gateway
![route table]<Week3\AWS-Assignment-Day2\routeTable.png>

Now one route is public and another is private 
Reason:
No Internet gateway for one subnet, that is private 
and the one with Internet gateway is public