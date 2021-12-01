docker build -t dockerworx/docker-squid .
docker run -d --name="docker-squid" \
            -e SQUID_USERNAME=enescva -e SQUID_PASSWORD=efsa \
            -p 3129:3128 dockerworx/docker-squid
