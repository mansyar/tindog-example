#!/bin/bash
# update tag
VERSION=$(git rev-parse --short HEAD)

TAG=${VERSION} docker compose build
TAG=${VERSION} docker compose push



TAG=${VERSION} envsubst < ./tindog/values.yaml > ./tindog/values.yaml

# helm install
sudo helm install --name tindog ./tindog --namespace my-project