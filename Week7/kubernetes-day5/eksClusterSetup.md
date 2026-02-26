# Create a public EKS cluster. Configure your local system to access and manage the cluster

## Public EKS cluster creation (AWS Console)
- Created EKS cluster via AWS console
- Configured cluster with public endpoint access enabled
- Selected VPC and subnets for networking
- Cluster control plane provisioned successfully

=> EKS cluster entered Active state with public API endpoint accessible.

## Managed Node group provisioning
- Created managed node group 
- Configured instance type and scaling parameters (desired node count to 1)
- Attached required IAM role for worker nodes
- EC2 instances launched and registered to cluster

=> Worker node joined cluster and registered to cluster 

## Add-on configuration
Installed required K8s networking conponents
- Amazon VPC CNI
- CoreDNS 
- kube-proxy

=> Cluster networking initialized successfully and all nodes are in ready state 

## Local system configuration
- Configured AWS CLI with account credentials
    - aws configure
    - aws sts get-caller-identity
- Updated kubeconfig using AWS CLI
    - aws eks update-kubeconfig --region ap-south-1 --name My-eks-Cluster-devops
- Connected local system to EKS cluster

## Cluster verfication
- verify connection - kubectl cluster-info
- Confirm the node status - kubectl get nodes    
- Check system pods - kubectl get pods -A