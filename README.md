# Squid-Proxy-with-Auth

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [Squid proxy server](http://www.squid-cache.org/).

Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more. It reduces bandwidth and improves response times by caching and reusing frequently-requested web pages. Squid has extensive access controls and makes a great server accelerator.

# Getting started

## Installation
Usage:
```
 docker run -d --name="docker-squid" \
           [-e "CACHE_PEER=user:escape_password@parent.proxy.example.com:8080"] \
            -p <HostPort>:3128 akrambenaissi/docker-squid
```

- Set CACHE_PEER to an url of your parent (upstream) proxy. Supports login authentication.

Examples:

```
 docker run -d --name="docker-squid" -p 3128:3128 \
            -e "CACHE_PEER=user:p%42ssword@otherproxy:8080" \
            akrambenaissi/docker-squid

```

## Configuration

Squid is a full featured caching proxy server and a large number of configuration parameters. To configure Squid as per your requirements mount your custom configuration at `/etc/squid/squid.conf`.

```bash
docker run --name squid -d --restart=always \
  --publish 3128:3128 \
  --volume squid.conf:/etc/squid/squid.conf \
  akrambenaissi/docker-squid
```
