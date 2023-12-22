#!/bin/bash
set -e

IMAGE_NAME="react-native-pjsip-builder/android"
CONTAINER_NAME="react-native-pjsip-builder-${RANDOM}"

rm -rf ./dist/android;
mkdir -p ./dist/;


DOCKER_BUILDKIT=0 docker build  --progress plain -t react-native-pjsip-builder/android ./android/;
docker run --name ${CONTAINER_NAME} ${IMAGE_NAME} bin/true

docker cp ${CONTAINER_NAME}:/dist/android ./dist/android

docker rm ${CONTAINER_NAME}
