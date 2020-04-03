#!/bin/bash

docker-compose build app
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push henriqueaf/rails_graphql:latest
docker logout
rm -rf /home/travis/.docker/config.json
