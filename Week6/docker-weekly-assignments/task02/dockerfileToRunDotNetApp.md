# Create Dockerfile to build and run .NET core application

## dotnet new webapi
This command generates a complete ASP.NET Core Web API project structure.
Transforms an empty directory into a runnable Web API application.

## Dockerfile – Build Stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
    Pulls the official .NET 8 SDK image.
    This image contains the compiler and tools required to build the application.

WORKDIR /app
    Sets the working directory inside the container.
    All following commands execute relative to /app.

COPY . .
    Copies the application source code from the host machine into the container filesystem.

RUN dotnet publish -c Release -o out
    Compiles the application in Release mode.
    Produces optimized, self-contained build output inside /app/out.

    This step transforms source code into runnable binaries.

## Dockerfile – Runtime Stage
FROM mcr.microsoft.com/dotnet/aspnet:8.0
    Uses a lightweight runtime image without SDK tools.
    Reduces final image size and improves security.

COPY --from=build /app/out .
    Copies compiled binaries from the build stage into the runtime container.
    Only necessary runtime files are included.

EXPOSE 8080
    Documents that the container listens on port 8080.
    Does not publish the port externally, but informs Docker and users.

ENV ASPNETCORE_URLS=http://+:8080
    Configures the application to bind to port 8080 inside the container.
    Without this, the application may default to a different internal port.

ENV ASPNETCORE_ENVIRONMENT=Development
    Changes runtime environment from Production (default) to Development.
    Enables Swagger UI and detailed debugging behavior.

ENTRYPOINT ["dotnet", "MyApp.dll"]
    Defines the startup command executed when the container launches.
    Runs the compiled Web API application.

## docker build -t myapp .
Reads the Dockerfile
Executes each instruction sequentially
Creates a Docker image named myapp
Stores the image locally

## docker run -d -p 8080:8080 myapp
Creates a container from the image
Maps host port 8080 to container port 8080
Runs the application in isolation