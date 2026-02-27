# Deploy a sample web application that uses a database. Application & Database should be hosted in separate containers, and the app should be able to communicate with the DB

## The architecture
The architecture ensures:
    Isolation of services
    Container-to-container communication
    Persistent database storage
    Reproducible deployment environment

## Application 
The system consists of two primary services:
    Application Container – Runs the web application logic
    Database Container – Runs the SQL database engine

## Workflow When docker compose up --build Is Executed
1. Compose File Interpretation

Docker Compose reads the docker-compose.yml file and:
    Identifies defined services
    Resolves build instructions
    Configures networks
    Configures volumes
    Registers environment variables

It treats all services as part of a single isolated project

## Image Build Process

For services containing a build directive:
    Docker reads the Dockerfile
    Pulls the required base image (if not available locally)
    Executes instructions layer-by-layer
    Creates a reusable application image
    Caches layers to optimize future builds

If no changes are detected in the Dockerfile or context, cached layers are reused

## Network Creation
Docker automatically creates a dedicated bridge network for the project.
    Each service joins this network
    Service names act as internal DNS hostnames
    The application connects to the database using the database service name

eg.: DB_HOST=db
