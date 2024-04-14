#!/bin/bash

# Preverite, če je spremenljivka okolja IMAGE_NAME pravilno nastavljena
if [ -z "$IMAGE_NAME" ]; then
  echo "Napaka: Spremenljivka okolja IMAGE_NAME ni nastavljena."
  exit 1
fi

# Preverite, če je spremenljivka okolja IMAGE_TAG pravilno nastavljena
if [ -z "$IMAGE_TAG" ]; then
  IMAGE_TAG="latest"
fi

# Preverite, če je spremenljivka okolja CONTAINER_NAME pravilno nastavljena
if [ -z "$CONTAINER_NAME" ]; then
  CONTAINER_NAME="moj_vsebnik"
fi

# Popolno ime slike vključuje uporabniško ime in tag
FULL_IMAGE_NAME="procookiee/$IMAGE_NAME:$IMAGE_TAG"

# Prenos slike iz Docker Hub
echo "Prenašanje slike $FULL_IMAGE_NAME..."
docker pull "$FULL_IMAGE_NAME"
if [ $? -ne 0 ]; then
  echo "Napaka pri prenašanju slike."
  exit 1
fi

# Zagon Docker vsebnika
echo "Zagon vsebnika $CONTAINER_NAME iz slike $FULL_IMAGE_NAME..."
docker run -d --name "$CONTAINER_NAME" "$FULL_IMAGE_NAME"
if [ $? -ne 0 ]; then
  echo "Napaka pri zagonu vsebnika."
  exit 1
fi

echo "Vsebnik $CONTAINER_NAME teče iz slike $FULL_IMAGE_NAME."
