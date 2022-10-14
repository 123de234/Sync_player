#!/bin/bash

# 仅编译web版本

export NODE_OPTIONS=--openssl-legacy-provider

rm -rf ./build
mkdir -p ./build

cd front
yarn
yarn build-web
cp -rf app/dist/renderer ../build
mv ../build/renderer ../build/dist
cd ..

cd syncplayer
go build server.go
cp -f server ../build/
cd ..

cd build
./server