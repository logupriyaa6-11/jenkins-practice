# Write a dockerfile -to update the versions of the packages currently installed on the system and to install CURL.

## Docker file implementation
'''
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y  curl \
    && rm -rf /var/lib/apt/lists/*

CMD ["sh"]
'''

## Explaination of the instructions

1. FROM ubuntu:22.04
- pulls Ubuntu 22.04 base image
- Serves as the foundational layer for the container

- Docker downloads the image if not available locally
- This becomes the base read-only layer

2. apt-get update
- Downloads the latest package index from Ubuntu repositories

- Updates /var/lib/apt/lists/
- Does NOT upgrade packages
- Ensures the system knows the latest available versions

3. apt-get upgrade -y
- Upgrades installed packages to their latest available versions

- Replaces older package binaries with updated ones.
- Applies security patches and bug fixes
- Modifies system libraries where required

4. apt-get install -y curl
- Installs curl and its required dependencies.

- Downloads curl package files
- Installs binaries to /usr/bin/
- Registers package in dpkg database

5. rm -rf /var/lib/apt/lists/*
- Removes cached package lists.

- Reduces image size
- Prevents unnecessary storage usage in final image

6. CMD["sh"]
- Defines default command when container starts
- Launches shell inside container

## Image building process
docker build --no-cache -t myimage .

    Docker reads Dockerfile sequentially
    Each instruction creates a new image layer
    A temporary container is created for each RUN instruction
    After execution, Docker commits changes as a new layer
    Final image myimage is created

Using --no-cache ensures:
    All instructions are executed fresh
    No previous cached layers are reused

## Container execution
docker run -it myimage sh

    Docker creates a new container from myimage
    A writable layer is added on top of the image
    /bin/sh is executed
    Container runs in isolation from the host system

## verification
curl --version

output: 
# curl --version
curl 7.81.0 (x86_64-pc-linux-gnu) libcurl/7.81.0 OpenSSL/3.0.2 zlib/1.2.11 brotli/1.0.9 zstd/1.4.8 libidn2/2.3.2 libpsl/0.21.0 (+libidn2/2.3.2) libssh/0.9.6/openssl/zlib nghttp2/1.43.0 librtmp/2.3 OpenLDAP/2.5.20
Release-Date: 2022-01-05
Protocols: dict file ftp ftps gopher gophers http https imap imaps ldap ldaps mqtt pop3 pop3s rtmp rtsp scp sftp smb smbs smtp smtps telnet HTTPS-proxy IDN IPv6 Kerberos Largefile libz NTLM NTLM_WB PSL SPNEGO SSL TLS-SRP UnixSockets zstd