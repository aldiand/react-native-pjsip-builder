FROM ubuntu:latest

RUN apt-get -y upgrade && \
    apt-get -y dist-upgrade && \
    apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
    wget unzip


##############################
# Download VialerPJSIP until iOS version is not released
##############################

RUN mkdir -p /vialer/ && \
    cd /vialer/ && \
    wget https://github.com/aldiand/Vialer-pjsip-iOS/archive/refs/tags/3.8.zip && \
    wget -O VialerPJSIP-device https://github.com/aldiand/Vialer-pjsip-iOS/raw/3.8/VialerPJSIP.xcframework/ios-arm64/VialerPJSIP.framework/Versions/A/VialerPJSIP && \
    wget -O VialerPJSIP-simulator https://github.com/aldiand/Vialer-pjsip-iOS/raw/3.8/VialerPJSIP.xcframework/ios-arm64_x86_64-simulator/VialerPJSIP.framework/Versions/A/VialerPJSIP && \
    unzip 3.8.zip

RUN mkdir -p /dist/ios/VialerPJSIP.framework && \
    mv /vialer/Vialer-pjsip-iOS-3.8/VialerPJSIP.xcframework/Versions/Current/* /dist/ios/VialerPJSIP.xframework && \
    mv /vialer/VialerPJSIP-device /dist/ios/VialerPJSIP.xcframework/ios-arm64/VialerPJSIP.framework/VialerPJSIP
    mv /vialer/VialerPJSIP-simulator /dist/ios/VialerPJSIP.xcframework/ios-arm64_x86_64-simulator/VialerPJSIP.framework/VialerPJSIP