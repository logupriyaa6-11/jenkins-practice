# Create config maps, secrets, and volumes and assign them to already created pods.

Overview: This assignment demonstrates how Kubernetes manages application configuration and sensitive data using ConfigMaps and Secrets, and how these resources are injected into a Pod through volumes.

## ConfigMaps
A ConfigMap is used to store non-sensitive configuration data such as application settings, environment values, or feature parameters.
Here,
    A ConfigMap was created containing key-value pairs.
    The ConfigMap was referenced in the Pod specification under the volumes section.
    It was mounted inside the container using volumeMounts.

When mounted as volumes:
    Each key in the ConfigMap becomes a file.
    The filename corresponds to the key.
    The file content corresponds to the value.

This allows the application to read configuration from the filesystem without modifying or rebuilding the container image. Configuration changes can be managed independently of the application code.

## Secrets
A Secret is used to store sensitive information such as usernames, passwords, API keys, or tokens.
Here,
    A Secret resource was created containing confidential credentials.
    The Secret was mounted into the container as a volume.
Although Secrets are stored in Kubernetes in base64-encoded format, when mounted as a volume they are automatically decoded and presented as files inside the container.

This ensure,
    ensitive data is not hardcoded into container images.
    Credentials are managed securely within the cluster.
    Access control can be applied using Kubernetes RBAC policies

## Volumes and Pod Integration
Volumes in Kubernetes provide a mechanism for containers to access external data.
When the Pod starts:
    The kubelet retrieves the referenced ConfigMap and Secret from the API server.
    Kubernetes creates temporary in-memory volumes containing the respective data.
    These volumes are mounted into the container before the application process starts.
    The container accesses the data as normal files within the mounted directories.

This approach follows Kubernetes best practices by:
    Decoupling configuration from container images
    Supporting immutable image strategies
    Improving security for sensitive data
    Enhancing portability and maintainability
    Allowing independent updates of configuration