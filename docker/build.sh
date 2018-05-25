#!/bin/sh -ex

TAG=tei1988/gke-certbot-dns-sample
VERSION=0.1.0
IMAGE=${TAG}:${VERSION}

docker build -t ${IMAGE} .
docker push ${IMAGE}
