#!/bin/bash

# Tu preverim če so vse spremenljivke okolja pravilno nastavljene
if [ -z "$DOCKER_USER" ] || [ -z "$DOCKER_PASSWORD" ] || [ -z "$IMAGE_NAME" ]; then
  echo "Napaka: Spremenljivke okolja niso pravilno nastavljene."
  exit 1
fi

# Če spremenljivka IMAGE_TAG ni nastavljena dam na latest
if [ -z "$IMAGE_TAG" ]; then
  IMAGE_TAG="latest"
fi

# Sesestavim full name
FULL_IMAGE_NAME="$DOCKER_USER/$IMAGE_NAME:$IMAGE_TAG"

# Prijava v Docker Hub
echo "Prijava v Docker Hub kot $DOCKER_USER..."
echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USER" --password-stdin
if [ $? -ne 0 ]; then
  echo "Napaka pri prijavi."
  exit 1
fi

# Docker build
echo "Gradnja slike $FULL_IMAGE_NAME..."
docker build -t "$FULL_IMAGE_NAME" .
if [ $? -ne 0 ]; then
  echo "Napaka pri gradnji slike."
  exit 1
fi

# Docker push
echo "Potiskanje slike $FULL_IMAGE_NAME na Docker Hub..."
docker push "$FULL_IMAGE_NAME"
if [ $? -ne 0 ]; then
  echo "Napaka pri potiskanju slike."
  exit 1
fi

echo "Slika $FULL_IMAGE_NAME je uspešno zgrajena in potisnjena na Docker Hub."
