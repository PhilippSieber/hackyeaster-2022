# solution
- pull public docker from docker.io
    - `docker pull hackyeaster/layercake:latest`
- analyze image (optional):
    - `dive hackyeaster/layercake:latest`
    - egg.png is copied 50 times, to /app/egg.png
- extract layers
    - `docker save hackyeaster/layercake:latest -o out.tar`
- in each layer, extract layer.tar to get app/egg.png
- view all png files and find egg with QR code

see `src/solve.sh`

# build

## Docker Hub 
- user `hackyeaster@gmail.com`
- pass `hacky.docker.hub.Easter`

## Docker
```
docker build -t hackyeaster/layercake:latest .
docker push hackyeaster/layercake:latest
```