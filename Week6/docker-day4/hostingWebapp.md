# Create docker container for Nginx and SQL-based images using the Docker compose file. Host the web app on Nginx container and when you add data to web-app container it should be add to your SQL database,

## Containers used 
The three containers in this project are:
    Nginx container for handling HTTP requests
    Flask application container for processing user input
    MySQL database container for storing SQL data persistently

## Workflow
    Client (Browser) -> Nginx (Port 80) -> Flask app (Port 5000) -> MySQL Database (Port 3306)

- User access the application via local host (http://localhost)
    ![verified with the local host](verifiyingWithLocalHost.png)
- The request from the host will be received by the Nginx container 
- The Nginx forwards the request to flask application container 
- The flask application processes the request 
- when the user submits data through web form -> the flask app inserts the data to the MySQL database 
- the db stores the data persistently using docker volume

## Docker compose configuration
The docker compose file defines and manages all services 

### Database Service (MySQL):
- Uses mysql:8 image
- Env variables are added: 
    root password
    database name
- uses a named docker volume (db_data) for persistent storage
- accessible internally using service name "db"

### Application Service (Flask)
- Build using custom dockerfile with is in app directory
- Connects to MySQL using env variables (DB_HOST, DB_PASSWORD, DB_USER, DB_NAME)
- depends on the db service 
- Runs on port 5000 internally
- Inserts submitted user data into the SQL database 

### Nginx service:
- Uses nginx:latest image
- exposes port 80 to the host machine
- proxies incoming request from flask application
- depends on app service 
- For configuration control, here we have used bind mount volume 

## Internal network
 Docker compose automatically creates a default network 
 Each service communicates using service names: 
 - db
 - nginx
 - app
No external IP configured 
Containers resolve each other through Docker's internal DNS