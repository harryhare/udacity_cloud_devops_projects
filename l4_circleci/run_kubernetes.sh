#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=harryhare/house_price_prediction

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run prediction\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=prediction

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
sleep 30
kubectl port-forward prediction 8000:80
