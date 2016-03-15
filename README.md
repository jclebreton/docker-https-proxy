# HTTPS HAProxy

Use HAProxy to create a basic HTTPS proxy.

This image is from [yajo/https-proxy](https://hub.docker.com/r/yajo/https-proxy/).

This image bypass the bug with dynamic variable when image is called from ``docker-compose``.

## Usage

    docker run -ti --rm -p 443:443 -e BACKEND_SERVER=www -e BACKEND_PORT=8080 jclebreton/https-proxy

Then navigate to https://127.0.0.1 and add security exception.

## Docker compose configuration

    version: '2'
    services:
        www:
            image: nginx
            container_name: www
            volumes:
                - '.:/usr/share/nginx/html:ro'
        haproxy:
            image: jclebreton/https-proxy
            container_name: haproxy
            depends_on:
                - www
            links:
                - www
            environment:
                - BACKEND_SERVER=www
                - BACKEND_PORT=80
            ports:
                - '443:443'
