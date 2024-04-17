# Janus WebRTC Gateway (docker image)

## Supported tags and respective `Dockerfile` links

* `latest`, `v1.2.2-bookworm` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.2.2-bookworm/Dockerfile)_
* `v1.2.1-bookworm` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.2.1-bookworm/Dockerfile)_
* `v1.2.1-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.2.1-bullseye/Dockerfile)_
* `v1.2.0-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.2.0-bullseye/Dockerfile)_
* `v1.1.4-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.1.4-bullseye/Dockerfile)_
* `v1.1.3-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.1.3-bullseye/Dockerfile)_
* `v1.1.2-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.1.2-bullseye/Dockerfile)_
* `v1.1.1-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.1.1-bullseye/Dockerfile)_
* `v1.1.0-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.1.0-bullseye/Dockerfile)_
* `v1.0.4-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.0.4-bullseye/Dockerfile)_
* `v1.0.3-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.0.3-bullseye/Dockerfile)_
* `v1.0.2-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v1.0.2-bullseye/Dockerfile)_
* `v0.14.2-bookworm` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.14.2-bookworm/Dockerfile)_
* `v0.14.1-bookworm` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.14.1-bookworm/Dockerfile)_
* `v0.14.1-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.14.1-bullseye/Dockerfile)_
* `v0.14.0-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.14.0-bullseye/Dockerfile)_
* `v0.13.4-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.13.4-bullseye/Dockerfile)_
* `v0.13.3-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.13.3-bullseye/Dockerfile)_
* `v0.13.2-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.13.2-bullseye/Dockerfile)_
* `v0.13.1-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.13.1-bullseye/Dockerfile)_
* `v0.13.0-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.13.0-bullseye/Dockerfile)_
* `v0.12.4-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.12.4-bullseye/Dockerfile)_
* `v0.12.3-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.12.3-bullseye/Dockerfile)_
* `v0.11.8-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.11.8-bullseye/Dockerfile)_
* `v0.10.10-bullseye` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/v0.10.10-bullseye/Dockerfile)_

## How to use this image

```bash
docker run -d -e "DOCKER_IP=<Public IP>" ladamalina/janus-gateway:latest
```

You have to pass `DOCKER_IP` env variable and configure STUN server. Otherwise Janus server will fail to communicate through your NAT. [Read more about ICE](https://github.com/meetecho/janus-gateway/issues/90)

You may want to change configuration files or record video meetings mounting it as volumes:

* `/var/janus/janus/etc`
* `/var/janus/janus/data`

By default ACL lists for http transport, admin api and websockets are empty and Janus does not perform any access control. For production you should configure firewall rules or reverse-proxy access control for ports `8088` and `8188`. Example:

```bash
docker run -d \
    -v `pwd`/data:/var/janus/janus/data \
    -v `pwd`/etc:/var/janus/janus/etc \
    --network host \
    -e "DOCKER_IP=<Public IP>" \
    --restart=unless-stopped \
    ladamalina/janus-gateway:latest
```

For more detailed instructions on WebRTC configuration please refer to [developer repository](https://github.com/meetecho/janus-gateway#janus-webrtc-server).
