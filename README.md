# Squid-Proxy-with-Auth-Caching-Another-Proxy

# Introduction

`Dockerfile` to create a [Docker](https://www.docker.com/) container image for [Squid proxy server](http://www.squid-cache.org/).

Squid is a caching proxy for the Web supporting HTTP, HTTPS, FTP, and more. It reduces bandwidth and improves response times by caching and reusing frequently-requested web pages. Squid has extensive access controls and makes a great server accelerator.

# Getting started

Details
=======

Environment variables
---------------------

* SQUID_USERNAME
* SQUID_PASSWORD
* CACHE_PEER

Ports
-----

* 3128

Volumes
-------

* `/var/log/squid3`

## Installation

A simple Dockerfile for launching an authenticated squid proxy with option to forward the squid proxy to another proxy with or without authentication.
This scenario comes valid when user is behind the corporate proxy

The user must specify authentication credentials via the following environment variables:

```
SQUID_USERNAME=foo
SQUID_PASSWORD=bar
CACHE_PEER=user:password@parent.proxy.example.com:8080
```

Clone the Repo:
```
git clone 
```

Build the image:
```
cd repo-name
```

```
  sudo docker build -t dockerworx/docker-squid .
```

Usage:
```
 docker run -d --name="docker-squid" \
            -e SQUID_USERNAME=foo -e SQUID_PASSWORD=bar \
           [-e "CACHE_PEER=user:password@parent.proxy.example.com:8080"] \
            -p <HostPort>:3128 dockerworx/docker-squid
```

- Set CACHE_PEER to an url of your parent (upstream) proxy. Supports login authentication.

An example invocation would be:

```
docker run -e SQUID_USERNAME=foo -e SQUID_PASSWORD=bar -p 3128:3128 robhaswell/squid-authenticated
```
Examples:

```
 docker run -d --name="docker-squid" -p 3128:3128 \
            -e SQUID_USERNAME=foo -e SQUID_PASSWORD=bar \
            -e "CACHE_PEER=user:p%42ssword@otherproxy:8080" \
            dockerworx/docker-squid

```

## Configuration

Squid is a full featured caching proxy server and a large number of configuration parameters. To configure Squid as per your requirements mount your custom configuration at `/etc/squid3/squid.conf`.

```bash
docker run --name squid -d \
  --publish 3128:3128 \
  --volume squid.conf:/etc/squid3/squid.conf \
  dockerworx/docker-squid
```


Ideas for Improvement
=====================

* Output logs to stdout.
* The range of authentication options could be expanded through more configuration options.
* Supply a full configuration file that has been well considered for mutiple options handled either in config or init file 

