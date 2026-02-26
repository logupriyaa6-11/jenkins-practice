# Create a pod with a basic HTML page and service to expose that pod

The project consists of three core Kubernetes components:

- Pod – Runs the NGINX container
- ConfigMap – Stores and injects custom HTML content
- Service (NodePort) – Exposes the application externally

## Deployed an NGINX-based Pod
- Provides a lightweight web server
- Demonstrates containerized application deployment
- Forms the base compute unit in Kubernetes
- Shows how Kubernetes manages container lifecycle

This establishes the application runtime environment inside the cluster.

## Injected Custom HTML Using a ConfigMap
Instead of modifying the container image, I used a ConfigMap to store the HTML file and mounted it into the container at: /usr/share/nginx/html

- Separates configuration from application images
- Avoids rebuilding Docker images for content changes
- Follows Kubernetes best practices
- Enables dynamic content updates without altering container images
- Improves portability and maintainability
This demonstrates configuration management in Kubernetes.

## Applied Labels for Resource Selection
The Pod was labeled:
- Enables grouping and selection of resources
- Allows Services to target specific Pods
- Demonstrates Kubernetes' label-based architecture
- Supports scalability and future expansion (e.g., replicas)

Labels are critical for Kubernetes service discovery and workload organization.

##  Exposed the Pod Using a NodePort Service
created a Service of type NodePort to expose the application outside the cluster.
- Enables external access to the application
- Demonstrates Kubernetes networking
- Shows how Services abstract Pod IP changes
- Provides stable access even if the Pod restarts
- Introduces service-based load balancing capabilities
This separates networking logic from the application itself.