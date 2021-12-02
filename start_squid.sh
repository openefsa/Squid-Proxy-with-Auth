docker build -t dockerworx/docker-squid .
docker run -d --name="docker-squid" \
            -e SQUID_USERNAME=user -e SQUID_PASSWORD=proxy \
            -p 3129:3128 dockerworx/docker-squid
