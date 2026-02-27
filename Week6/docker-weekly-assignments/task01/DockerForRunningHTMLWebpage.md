# Create custom Dockerfile for running a sample html website

## Workflow
There are 3 major phase
1. Image creation
2. Container Initialization 
3. Request Handling 

## Image creation phase - Build phase
Base Image -> nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
    - Executes during the image build process 
    - It removes static file with nginx ensures clean replacement with custom file
COPY html/ /usr/share/nginx/html/
    - Transfers the local HTML files to container image
    - means that this webpage becomes a part of the image
    - at this stage the image contains both the server(nginx) and website content
EXPOSE 80
    - Listens to port 80 internally
    - It does not push the port automatically
CMD ["nginx", "-gt", "daemon off;"]
    - This defines the default process that runs when the container starts
    - By setting "daemon off;" nginx starts in foreground instead of background mode
    - This is to keep the container alive

## Container initialization - Container execution
Building the image
    - docker build -t my-html-site .
this command
    - reads the Dockerfile 
    - Executes each instructions
    - Creates a layered image
    - Tags and final image as my-html-site

Each instruction creates a new image layer, these layers are cached and reused if unchanged, improving build efficiency.

## Request handing - Running an image
Running an image
    - docker run -p 8080:80 my-html-site
this command
    - Intantiates the container from the image
    - Allocates fielsystem and networking resources
    - maps host port 8080 to container port 80

Once running:
    The browser sends an HTTP request to localhost:8080
    Docker forwards the request to container port 80
    Nginx processes the request
    The index.html file is served
    The response is returned to the browser