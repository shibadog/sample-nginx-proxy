# sample nginx proxy

## Overview

This repository is a sample of [jwilder/nginx-proxy](https://hub.docker.com/r/jwilder/nginx-proxy/).　

This container simplify nginx proxying containers in the same network.

I'm not sure, but, if set the environment variable `VIRTUAL_HOST` to a container in the same network, can access with the environment variable set by the exposure port of the container.

I will investigate later about how to make it...

In this sample can access Elasticsearch and Kibana.

## Install

```
$ docker network create common_link
$ docker-compose -f ./etc/docker-compose.d/proxy/docker-compose.yml up -d
$ docker-compose -f ./etc/docker-compose.d/service.elastic/docker-compose.yml up -d
```

## Access

```
$ curl -H "Host: kibana.local" localhost
```

for browser

mac
```
$ echo '127.0.0.1   kibana.local' | sudo tee -a /private/etc/hosts
```

windows
あとで作る
