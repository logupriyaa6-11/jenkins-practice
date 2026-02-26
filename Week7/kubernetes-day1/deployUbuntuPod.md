# Create a basic minikube cluster on local system. Create a namespace and deploy an ubuntu POD in it.

When Minikube is started on a local system, it creates a single-node Kubernetes cluster inside a virtualized environment (usually Docker or a VM). This node acts as both the control plane and worker node.

During cluster startup:
    A Kubernetes control plane is initialized.
    Core components such as the API Server, Scheduler, Controller Manager, and etcd are started.
    A container runtime (like Docker or containerd) becomes responsible for running containers.
    The kubectl client is configured to communicate with this local cluster.
    Once the cluster is running, it is capable of accepting Kubernetes API requests.

## Namespace Creation
When a namespace is created:
    A logical isolation boundary is registered inside the cluster.
    The namespace entry is stored in etcd (the cluster’s key-value database).
    Kubernetes begins treating it as a separate environment for resources such as Pods, Services, and Deployments.

Namespaces do not create new nodes or infrastructure.
They simply organize and isolate resources within the same cluster.

## Ubuntu Pod Deployment
When the Ubuntu Pod is deployed:
    The request is sent to the Kubernetes API Server.
    The Pod definition is stored in etcd.
    The Scheduler assigns the Pod to the available node (Minikube node).
    The Kubelet on that node receives the instruction.
    The container runtime pulls the Ubuntu image (if not already present).
    A container is created and started using that image.

Because a command such as sleep is specified, the container remains in a running state.
Without a running process, the container would exit immediately.

## Pod Execution
When executing a command inside the Pod:
    kubectl sends the request to the API Server.
    The request is forwarded to the Kubelet on the node.
    The Kubelet connects to the running container.
    An interactive shell session is established inside the container.

This allows direct interaction with the Ubuntu environment running inside Kubernetes.

## Resource Lifecycle
All created resources (Namespace and Pod):
    Exist as objects inside the Kubernetes API.
    Are tracked in etcd.
    Are managed continuously by the control plane.
    Remain active until explicitly deleted.

When deleted:
    The API Server removes the object definition.
    The Kubelet stops and removes the container.
    The container runtime cleans up the resources.