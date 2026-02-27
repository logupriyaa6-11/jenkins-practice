## What is Docker?
Docker is a containerization platform that allows applications to run in isolated environments called containers
Containers package:
    Application code
    Dependencies
    Libraries
    Runtime
## Advantages of Docker
- Lightweight
- Fast startup
- Consistent environments
- Easy scaling
- Portable across systems

## Docker workflow
Write a dockerfile -> Build an image -> run a container from that image -> execute commands inside the container -> Stop and remove container

## Docker Architecture 
### Docker client 
- It's a CLI 
- Client tells the docker daemon to execute the command
- client -> talks to -> daemon -> It does the execution
- It can communicate with more than one daemon

## Docker Daemon 
- It executes the commands from docker client CLI
- It acts as a manager to 
    Builds image
    runs container
    stops container
    manages network
    manages volumes 

## Docker registry
- stores the image
- There are 2 types of docker registry 
    - public registry (eg: docker hub, GitHub docker registry)
    - private registry (eg: Amazon Elastic Container Registry, Azure Container Registry, Google Artifact Registry)

## Docker Images (blueprint/template)
- Dockerfile contains set of instructions after executing those instruction Image will be created 
- It is a read-only template 
- It's immutable 

## Docker Container
- Running instance of image 
- Executable software package that packs an application with all the dependencies 
- This makes the software run quickly on any environment