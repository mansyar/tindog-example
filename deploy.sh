#!/bin/bash
# update tag
VERSION=$(git rev-parse --short HEAD)

TAG=$VERSION docker compose build
TAG=$VERSION docker compose push



TAG=$VERSION sed -i "s/\${TAG}/$TAG/g" ./tindog/values.yaml

# helm install
sudo helm install tindog ./tindog --namespace my-project --kubeconfig /home/ansyar/kubeconfig.yaml