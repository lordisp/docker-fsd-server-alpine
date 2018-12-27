# FSD Server for Microsoft Flight-Simulator X
You may want to customize the [fsd.conf](https://github.com/lordisp/docker-fsd-server-alpine/blob/master/src/fsd.conf "fsd.conf") and mount a persitent volume using the -v flag



### Run from Docker
```dockerfile
docker run -d \
           --name fsd-server \
           -p 3010:3010 \
           -p 3011:3011 \
           -p 6809:6809 \ 
           innohub/fsd-server:1.0-apline
```
### Run using docker-compose
```
version: '3'
services:

  fsd-server:
    image: innohub/fsd-server:1.0-apline
    volumes: 
      - ./src:/var/fsd
    ports: 
      - "3010:3010"
      - "3011:3011"
      - "6809:6809"
    networks: 
      - fsd-net

networks:
  fsd-net:
```
