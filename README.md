# docker-filebeat

Containerized, multiarch version of filebeat

## How to Build

Build using `buildx` for multiarchitecture image and manifest support

Setup buildx

```bash
docker buildx create --name multiarchbuilder
docker buildx use multiarchbuilder
docker buildx inspect --bootstrap
[+] Building 0.0s (1/1) FINISHED
 => [internal] booting buildkit                                                                                                                 5.7s 
 => => pulling image moby/buildkit:buildx-stable-1                                                                                              4.6s 
 => => creating container buildx_buildkit_multiarchbuilder0                                                                                     1.1s 
Name:   multiarchbuilder
Driver: docker-container

Nodes:
Name:      multiarchbuilder0
Endpoint:  npipe:////./pipe/docker_engine
Status:    running
Platforms: linux/amd64, linux/arm64, linux/ppc64le, linux/s390x, linux/386, linux/arm/v7, linux/arm/v6
```

Build

```bash
docker buildx build --platform linux/arm -t jmb12686/filebeat:latest --push .
```

## How to Run

```bash
sudo docker run --rm -v /home/pi/raspi-docker-stacks/elk/filebeat/config/filebeat.yml:/usr/share/filebeat/filebeat.yml jmb12686/filebeat
```

```bash
sudo docker run   --name=filebeat   --user=root   --volume="/home/pi/raspi-docker-stacks/elk/filebeat/config/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro"   --volume="/var/lib/docker/containers:/var/lib/docker/containers:ro"   --volume="/var/run/docker.sock:/var/run/docker.sock:ro" --entrypoint=""  jmb12686/filebeat /usr/share/filebeat/filebeat --strict.perms=false
```

```bash
sudo docker run -it  --name=filebeat   --user=root   --volume="/home/pi/raspi-docker-stacks/elk/filebeat/config/filebeat.yml:/usr/share/filebeat/filebeat.yml"   --volume="/var/lib/docker/containers:/var/lib/docker/containers:ro"   --volume="/var/run/docker.sock:/var/run/docker.sock:ro" -e ELASTICSEARCH_HOST=localhost jmb12686/filebeat
```
