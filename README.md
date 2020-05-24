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

If you are using Github Actions, you can use the below action for your workflow:

Sample usage in github action job:

```yaml
jobs:
  setup-build-publish-deploy:
    name: Run tests
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
      with:
        token: ${{ secrets.GITHUB_TOKEN }}
        submodules: true

    - name: Test redis cluster
      uses: vishnudxb/redis-cluster@1.0.5
      with:
        master1-port: 5000
        master2-port: 5001
        master3-port: 5002
        slave1-port: 5003
        slave2-port: 5004
        slave3-port: 5005

     # Running Test
    - name: Running Test
      run: |
         sudo apt-get install -y redis-tools
         docker ps -a
         redis-cli -h 127.0.0.1 -p 5000 ping
         redis-cli -h 127.0.0.1 -p 5000 cluster nodes
```

## You can see the Output something like below from the Github action log:

![](https://i.imgur.com/JtzVMNr.png)

## For more details, check this [link](https://github.com/marketplace/actions/redis-cluster-with-master-slave)
