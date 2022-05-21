#!/bin/bash
mkdir solution && cd solution
docker pull hackyeaster/layercake:latest
docker save hackyeaster/layercake:latest -o out.tar
tar -xvf out.tar
for i in $(ls */layer.tar)
do
  tar -xvf $i
  mv app/egg.png ./$(uuidgen).png
done