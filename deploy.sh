#!/bin/bash
# update tag
export VERSION=$(git rev-parse --short HEAD)

TAG=$VERSION docker compose build
TAG=$VERSION docker compose push

export TAG=${VERSION} 
echo $VERSION
echo $TAG
sed -i "s/\${TAG}/$TAG/g" ./tindog/values.yaml

# helm install
sudo helm upgrade --install tindog ./tindog --namespace my-project --kubeconfig /home/ansyar/kubeconfig.yaml