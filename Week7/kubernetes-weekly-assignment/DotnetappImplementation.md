# Use the ECR image created for the .Net application and deploy it on minikube. The Application in the pod should be accessible on the browser. Assign suitable resource limits and requests on namsepace and deployment levels respectively.

## Application Creation & Containerization
A .NET Web API application was created and verified locally.  
The application was then containerized using Docker.

- dotnet new webapi -n DotnetApp
- cd DotnetApp
- dotnet run
- docker build -t dotnet-app .
- docker run -p 8080:8080 dotnet-app

=> Application successfully built
   Docker image created
   Container tested and accessible via browser

## Push Docker Image to Amazon ECR
The Docker image was tagged and pushed to a private Amazon ECR repository.

docker tag dotnet-app:latest 760659115753.dkr.ecr.ap-south-1.amazonaws.com/dotnet-app:v1

aws ecr get-login-password --region ap-south-1 | \
docker login --username AWS --password-stdin 760659115753.dkr.ecr.ap-south-1.amazonaws.com

docker push 760659115753.dkr.ecr.ap-south-1.amazonaws.com/dotnet-app:v1

=> Image successfully stored in private ECR
   Repository ready for Kubernetes deployment

## Kubernetes Cluster Setup (Minikube)
Minikube cluster was started to deploy the application locally.

- minikube start --driver=docker
- kubectl get nodes

=> Local Kubernetes cluster initialized
   Node in Ready state

## Namespace Creation with ResourceQuota
A dedicated namespace was created and resource limits were enforced at namespace level.

- kubectl apply -f namespace.yaml
- kubectl describe quota -n dotnet-ns

Resource Configuration
- requests.cpu: 1
- requests.memory: 1Gi
- limits.cpu: 2
- limits.memory: 2Gi

=> Resource consumption controlled at namespace level

## Deployment with Resource Requests & Limits
Deployment was created using the ECR image with container-level CPU and memory limits.

kubectl create secret docker-registry ecr-secret \
  --docker-server=760659115753.dkr.ecr.ap-south-1.amazonaws.com \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region ap-south-1) \
  --namespace=dotnet-ns

  kubectl apply -f deployment.yaml
  kubectl get pods -n dotnet-ns

Resource Configuration (Container Level)
- CPU Request: 250m  
- CPU Limit: 500m  
- Memory Request: 256Mi  
- Memory Limit: 512Mi  

=>Pod successfully pulled image from private ECR
Resource limits enforced at deployment level
Pod reached Running state

## Service Exposure & Browser Access
A NodePort service was created to expose the application externally.

kubectl apply -f service.yaml
kubectl get svc -n dotnet-ns
minikube service dotnet-service -n dotnet-ns

=>Service exposed via NodePort
Application accessible in browser
Swagger UI successfully loaded