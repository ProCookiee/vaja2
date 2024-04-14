#!/bin/bash

# Preverim če je vse prav nastavljeno
if [ -z "$IMAGE_NAME" ]; then
  echo "Napaka: Spremenljivka okolja IMAGE_NAME ni nastavljena."
  exit 1
fi

if [ -z "$IMAGE_TAG" ]; then
  IMAGE_TAG="latest"
fi

if [ -z "$CONTAINER_NAME" ]; then
  CONTAINER_NAME="container"
fi

# Dam celo ime
FULL_IMAGE_NAME="procookiee/$IMAGE_NAME:$IMAGE_TAG"

# Pull docker image
echo "Prenašanje slike $FULL_IMAGE_NAME..."
docker pull "$FULL_IMAGE_NAME"
if [ $? -ne 0 ]; then
  echo "Napaka pri prenašanju slike."
  exit 1
fi

# Run docker container
echo "Zagon vsebnika $CONTAINER_NAME iz slike $FULL_IMAGE_NAME..."
docker run -d --name "$CONTAINER_NAME" "$FULL_IMAGE_NAME"
if [ $? -ne 0 ]; then
  echo "Napaka pri zagonu vsebnika."
  exit 1
fi

echo "Vsebnik $CONTAINER_NAME teče iz slike $FULL_IMAGE_NAME."
