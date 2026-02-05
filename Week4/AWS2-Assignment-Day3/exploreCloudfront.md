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

## Why CloudFront with ALB
CloudFront is a content delivery network (CDN) that caches and delivers content from edge locations closer to users.
Using an Application Load Balancer (ALB) as the origin allows CloudFront to serve dynamic and static content backed by multiple EC2 instances.

## Cache Behavior Understanding
CloudFront caches responses at edge locations
Edge locations are CloudFront’s nearby servers placed around the world.
Instead of sending every user request all the way to your main server, CloudFront uses these nearby servers to respond faster.

## Why do edge locations exist?
Without edge locations:
User request travels far
Website loads slow

With edge locations:
Request travels a short distance
Website loads faster

## traffic flow
User -? Nearest Edge Location -> (Fast Response)
                   |
                ALB (only if needed) (may be Slow Response)

## flow of cloudfront
User -> CloudFront Edge Location -> (Cache Hit) Response served directly -> (Cache Miss) Forwarded to ALB -> ALB routes request to EC2 -> Response cached at CloudFront