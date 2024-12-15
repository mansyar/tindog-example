#!/bin/bash
# update tag
VERSION=$(git rev-parse --short HEAD)

TAG=${VERSION} docker compose build
TAG=${VERSION} docker compose push


for file in ./tindog/*.yaml; do
  TAG=${VERSION} envsubst < "$file" > "$file"
done

for file in ./tindog/templates/*.yaml; do
  TAG=${VERSION} envsubst < "$file" > "$file"
done

cat ./tindog/Charts.yaml
cat ./tindog/values.yaml

# helm install
sudo helm install --set name=tindog tindog ./tindog --namespace my-project