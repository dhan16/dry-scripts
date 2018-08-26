# Use phusion/baseimage as base image
FROM phusion/baseimage:0.9.22

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Basics 
RUN apt-get update
RUN apt-get install -y sudo wget

# Connectivity
# ssh
RUN rm -f /etc/service/sshd/down
# add guest user
RUN adduser --disabled-password --gecos "Guest user" guest
RUN ["/bin/bash", "-c", "echo -e 'guest\nguest\n' |  passwd guest"]
RUN adduser guest sudo
# tightvncserver
RUN apt-get install -y xfce4 xfce4-goodies libtasn1-3-bin libtasn1-bin
RUN wget https://bintray.com/tigervnc/stable/download_file?file_path=ubuntu-16.04LTS%2Famd64%2Ftigervncserver_1.8.0-1ubuntu1_amd64.deb
RUN dpkg -i download_file\?file_path\=ubuntu-16.04LTS%2Famd64%2Ftigervncserver_1.8.0-1ubuntu1_amd64.deb

# fix ssl
RUN apt-get install -y libssl1.0.0 libssl-dev
RUN cd /lib/x86_64-linux-gnu && ln -s libssl.so.1.0.0 libssl.so.10
RUN cd /lib/x86_64-linux-gnu && ln -s libcrypto.so.1.0.0 libcrypto.so.10

# lapack
RUN apt-get install -y liblapack-dev

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
