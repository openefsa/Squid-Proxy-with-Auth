docker build -t dockerworx/docker-squid .
docker run -d --name="docker-squid" \
            -e SQUID_USERNAME=username -e SQUID_PASSWORD=proxypass \
            -p 3129:3128 dockerworx/docker-squid
