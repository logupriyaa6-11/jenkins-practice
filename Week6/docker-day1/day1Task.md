# Docker commands to run any command inside the container and close the container.

## Pulling an image
docker pull ubuntu:22.04

- Docker downloads the image layers from Docker Hub
- Image stored locally
- No container is created yet.

## Running a container 
docker run -it ubuntu:22.04
-i (container can receive input from the keyboard)
-t (allocates a pseudo terminal, formats the output)

- container started
- bash shell opened 
- on typing "exit" stops the container

## Naming a container
docker run -dit --name my_ubuntu ubuntu:22.04 bash 
-d (detached mode)
-i (container can receive input from the keyboard)
-t (allocates a pseudo terminal, formats the output)
--name (assigns predictable name)

## Checking container status 
docker ps - shows running containers
docker ps -a - shows all containers incl stopped containers

## Executing commands in running containers 
docker exec -it my_ubuntu bash

- Opens a new bash shell inside the running container  
- docker exec works only if the container is running  
- Typing "exit" closes only this shell  
- The container continues running in the background  

## Inspecting container 
docker inspect my_ubuntu

It provides 
- Container ID
- Network details
- Mount paths
- Restart policy
- Runtime info
- Logging driver
- Storage driver

## View logs
docker logs <container>

docker logs my_ubuntu (list the STDOUT of that container)
docker logs -f my_ubuntu (Live streaming of logs -> press ctrl+C to stop watching)

## Stopping and removing containers 
docker stop my_ubuntu 
docker rm my_ubuntu

- Avoids leaving unused containers (consumes disk, confuses monitoring, causes resource waste)

## clean up commands 
docker container prune - removes all stopped containers
docker system prune - removes containers, networks, images and cache
docker image prune - removes unused images i.e., image not used by any containers