#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=harryhare/house_price_prediction

# Step 2:  
# Authenticate & tag
dockerid=harryhare
echo "Docker ID: $dockerid and Image: $dockerpath"
docker login -u $dockerid
docker tag house_price_prediction harryhare/house_price_prediction:latest

# Step 3:
# Push image to a docker repository
docker push harryhare/house_price_prediction:latest