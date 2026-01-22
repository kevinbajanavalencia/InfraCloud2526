# Dc1 – Run containers-experiment

# Docker – Essentiële commando’s

## Images
docker images
docker build -t di2-flask-app .

## Containers
docker ps
docker ps -a

## Run container
docker run -p 5000:5000 di2-flask-app

## Stop / remove
docker stop di2_container
docker rm di2_container

## Logs
docker logs di2_container

## Test
curl http://localhost:5000

