# Create a Deployment with 3 replicas of a NGNIX web app, create hpa and assign auto scaling.

## Kubernetes Deployment with Horizontal Pod Autoscaling (HPA)
A Deployment running NGINX
A ClusterIP Service for internal communication
A Horizontal Pod Autoscaler (HPA) for automatic scaling
The Metrics Server for resource monitoring

## Enable metrics server 
- minikube addons enable metric-server
This command enables the Metrics Server in Minikube.
Metrics Server collects CPU and memory usage from each node’s kubelet and exposes it to the Kubernetes Metrics API.

## verify metric server 
- kubectl get pods -n kube-system 
This command enables the Metrics Server in Minikube.
Metrics Server collects CPU and memory usage from each node’s kubelet and exposes it to the Kubernetes Metrics API.

## create deployment
- kubectl create deployment demo --image=nginx --replicas=3 --dry-run=client -o yaml > demo.deployment.yaml

- edit the yaml file by adding the cpu limits and requests 

Kubernetes creates the replicaset -> the replicaset ensures 3 pods are always running -> if pod crashes kubernetes creates it automatically -> CPU requests and limits define resource boundries for scaling calculation

## verify deployment
- kubectl get pods
Displays the runnig pods created by deployment 
Confirms that 3 replicas of the application are active

## Create service 
- kubectl create service clusterip demo --tcp=80:80 --dry-run=client -o yaml > demo-service.yaml

Assigns stable virtual IP 
Enables internal DNS => http://demo
Load balances traffic across all running pods 

## Verify service
- kubectl get svc 

## create HPA 
- kubectl autoscale deployment demo --cpu=5% --min=3 --max=10
(or)
- kubectl autoscale deployment demo --cpu=5% --min=3 --max=10 --dry-run=client -o yaml > demo-hpa.yaml

Moniters CPU utilization and maintains minimum 3 replicas and scales upto maximum of 10 replicas 
It triggers scaling when the cpu exceeds 5%

## Monitor autoscaling
- kubectl get hpa => Displays current CPU utilization and replica count.
- kubectl get hpa -w => Displays current CPU utilization and replica count.

## Check resource usage 
- kubectl top pods
Displays live CPU usage and memory usage of pods 
To verify the load is affecting the application pod

## Generate load 
- kubectl exec -it load-generator -- /bin/sh
/ # while true; do wget -q -O- http://demo; done

The service named demo receives the traffic 
Distributes request across all pods
When HPA scaled from 6 -> 10 replicas 
Traffic automatically spread across new pods