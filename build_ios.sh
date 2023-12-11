#!/bin/bash
set -e

IMAGE_NAME="react-native-pjsip-builder/ios"
CONTAINER_NAME="react-native-pjsip-builder-${RANDOM}"

rm -rf ./dist/ios;
mkdir -p ./dist/;

docker build -t react-native-pjsip-builder/ios ./ios/;
docker run --name ${CONTAINER_NAME} ${IMAGE_NAME} bin/true

docker cp ${CONTAINER_NAME}:/dist/ios.tar.gz ./dist/ios.tar.gz

docker rm ${CONTAINER_NAME}

tar -xzf ./dist/ios.tar.gz -C ./dist/

rm ./dist/ios.tar.gz