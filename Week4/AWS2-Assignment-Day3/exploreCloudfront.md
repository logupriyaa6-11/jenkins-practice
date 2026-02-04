# Explore Cloudfront and showcase ALB as origin to it

## Step 1:
Create cloud front distribution
AWS console -> CoudFront -> Create distribution

Distribution options: 
Distribution name: Cloudfront-alb-practice
Distribution type: Single website or app

Specify origin:
Origin type: Elastic load balancer
Elastic Load Balancing origin: devops-alb-990124075.ap-south-1.elb.amazonaws.com

Enable security:
Web Application Firewall (WAF): do not Enable security protections

![cloud front distribution]<Week4\AWS2-Assignment-Day3\createCloudFrontDistribution.png>