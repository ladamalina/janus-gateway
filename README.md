# Janus WebRTC Gateway (docker image)

## Supported tags and respective `Dockerfile` links

* `latest`, `0.4.3-stretch-updated-dependencies-20180830` _[(0.4.3/debian9/updated-dependencies-20180830/Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/0.4.3/debian9/updated-dependencies-20180830/Dockerfile)_
* `0.4.3-stretch` _[(0.4.3/debian9/stable/Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/0.4.3/debian9/stable/Dockerfile)_
* `0.4.3-buster` – broken libnice 0.1.14 – _[(0.4.3/debian10/testing/Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/0.4.3/debian10/testing/Dockerfile)_
* `0.4.2-stretch` _[(0.4.2/debian9/stable/Dockerfile)](https://github.com/ladamalina/janus-gateway/blob/master/0.4.2/debian9/stable/Dockerfile)_

## How to use this image

```bash
docker run -d -e "DOCKER_IP=<Public IP>" ladamalina/janus-gateway:latest
```

You have to pass `DOCKER_IP` env variable and configure STUN server. Otherwise Janus server will fail to communicate through your NAT. [Read more about ICE](https://github.com/meetecho/janus-gateway/issues/90)

You may want to change configuration files or record video meetings mounting it as volumes: `/var/janus/janus/etc`, `/var/janus/janus/data`.

By default ACL lists for http transport, admin api and websockets are empty and Janus does not perform any access control. For production you should configure firewall rules or reverse-proxy access control for ports `8088` and `8188`. Example:

```bash
docker run -d \
	-v `pwd`/data:/var/janus/janus/data \
	-v `pwd`/etc:/var/janus/janus/etc \
	-p 127.0.0.1:8088:8088/tcp \
	-p 127.0.0.1:8188:8188/tcp \
	-p 10000-11000:10000-11000/udp \
	-e "DOCKER_IP=<Public IP>" \
	--restart=unless-stopped \
	ladamalina/janus-gateway:latest
```

For more detailed instructions on WebRTC configuration please refer to [developer repository](https://github.com/meetecho/janus-gateway#janus-webrtc-server).
