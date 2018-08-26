#### Build
docker build -t unixed/phusionplay:latest .

#### Push
docker push unixed/phusionplay:latest

#### Run
docker run -ti --rm -p 2222:22 -p5901:5901 -v ~/Downloads:/Downloads unixed/phusionplay:latest bash

#### ssh
ssh -p 2222 -o UserKnownHostsFile=/dev/null guest@localhost

#### VNC
##### on container
 * su guest
 * vncserver
##### on host
Run VNC Viewer and connect to localhost:1
