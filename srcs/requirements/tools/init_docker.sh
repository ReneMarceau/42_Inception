#!/bin/bash

# A script to install docker and docker-compose

apt-get update -y
apt-get upgrade -y

# Install packages to allow apt to use a repository over HTTPS
for package in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc
do
    apt-get remove $package -y
done

# Add Docker’s official GPG key
apt-get update -y
apt-get install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y

# Install Docker
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to docker group
if [ $(getent group docker) ]; then
    echo "docker group already exists. Skipping setup."
else 
    newgrp docker
fi
groupadd docker
usermod -aG docker $USER
# newgrp docker

# Run Docker
service docker start
systemctl start docker
