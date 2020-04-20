# Janus WebRTC Gateway (docker image)

## Supported tags and respective `Dockerfile` links

* `latest`, `0.9.2-stretch` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.9.2-stretch/Dockerfile)_
* `0.8.2-stretch` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.8.2-stretch/Dockerfile)_
* `0.7.6-stretch` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.7.6-stretch/Dockerfile)_
* `0.6.3-stretch` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.6.3-stretch/Dockerfile)_
* `0.5.0-stretch` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.5.0-stretch/Dockerfile)_
* `0.4.3-stretch-updated-dependencies-20180830` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.4.3-stretch-updated-dependencies-20180830/Dockerfile)_
* `0.4.3-stretch` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.4.3-stretch/Dockerfile)_
* `0.4.3-buster` – broken libnice 0.1.14 – _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.4.3-buster/Dockerfile)_
* `0.4.2-stretch` _[(Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/0.4.2-stretch/Dockerfile)_

## How to use this image

```bash
docker run -d -e "DOCKER_IP=<Public IP>" ladamalina/janus-gateway:latest
```

You have to pass `DOCKER_IP` env variable and configure STUN server. Otherwise Janus server will fail to communicate through your NAT. [Read more about ICE](https://github.com/meetecho/janus-gateway/issues/90)

You may want to change configuration files or record video meetings mounting it as volumes:

* `/var/janus/janus/etc`,
* `/var/janus/janus/data`.

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
