#!/bin/bash
docker build -t goforgold .
id=$(docker create goforgold)
docker cp $id:/app/gold - > gold.tar
docker rm -v $id
tar -xvf gold.tar
zip -r ../files/gold.zip gold
rm gold gold.tar