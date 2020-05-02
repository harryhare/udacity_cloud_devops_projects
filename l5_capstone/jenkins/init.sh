#! /bin/bash

sudo apt update -y
sudo apt install -y default-jdk 


# install jenkins
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get install -y  jenkins


# docker
sudo apt install -y docker.io
sudo usermod -aG docker ubuntu
sudo usermod -aG docker jenkins
# docker login


# kubectl 1.15.0
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl


# tidy
sudo apt-get install -y tidy


# halolint
curl -LO https://github.com/hadolint/hadolint/releases/download/v1.17.6/hadolint-Linux-x86_64
chmod +x ./hadolint-Linux-x86_64
sudo mv ./hadolint-Linux-x86_64 /usr/local/bin/hadolint



# aws cli
sudo apt install -y python3-pip
pip3 install awscli --upgrade
# aws configure


# aws - eks init
aws eks --profile  default --region us-west-2  update-kubeconfig --name app-cluster1

