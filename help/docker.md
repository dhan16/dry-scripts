### Commands

1. build: docker build -t <repo>/<image>:<tag> .

2. push: docker push <repo>/<image>:<tag>

3. Stop/remove all of Docker containers/images:
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    docker rmi $(docker images -f dangling=true -q)
    docker volume rm $(docker volume ls -f dangling=true -q)

### Notes
    1. On Macs, this seems to take a lot of disk space: ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
