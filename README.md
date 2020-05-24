# docker-redis-cluster

[![](https://images.microbadger.com/badges/image/vishnunair/docker-redis-cluster.svg)](https://microbadger.com/images/vishnunair/docker-redis-cluster)
[![](https://images.microbadger.com/badges/version/vishnunair/docker-redis-cluster.svg)](https://microbadger.com/images/vishnunair/docker-redis-cluster)

A small docker container for redis cluster

*You can pull this image from the docker hub*

```
docker pull vishnunair/docker-redis-cluster:latest

```
*For eg: You can start the redis cluster using the below command*

```
docker run -d -p 5000:6379 -p 5001:6380 -p 5002:6381 -p 5003:6382 -p 5004:6383 -p 5005:6384 --name redis-cluster vishnunair/docker-redis-cluster

```

*For eg: You can check the cluster nodes using the below command*

```
redis-cli -h 127.0.0.1 -p 5000 cluster nodes

```

