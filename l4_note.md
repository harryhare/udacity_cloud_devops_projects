### dockerfile 中的 expose

* 似乎只是在-P 运行时才有效果

* docker run -p 8081:80 这种有没有expose 都是无所谓的

https://blog.csdn.net/qq_17639365/article/details/86655177


### kubenetes 

#### 安装

- minikube
	- 文档：https://kubernetes.io/docs/tasks/tools/install-minikube/
	- curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
	  && chmod +x minikube
	- sudo install minikube /usr/local/bin/
	- 在minikube start 时会报错没有driver
		于是我跑了
		```
		sudo apt install kvm-qemu
		sudo apt install libvirt-clients
		```
	- minikube start 会从gcr.io拉资源，而grc.io被墙

- kubectl
	- curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	
- docker for windows
	-启动kubenets 非常慢
	
	
#### 使用

```
minikube version
minikube start

kubectl version
kubectl cluster-info
kubectl get nodes


#!/usr/bin/env bash

dockerpath="noahgift/flasksklearn"

# Run in Docker Hub container with kubernetes
kubectl run flaskskearlndemo\
    --generator=run-pod/v1\
    --image=$dockerpath\
    --port=80 --labels app=flaskskearlndemo

# List kubernetes pods
kubectl get pods

# Forward the container port to host
kubectl port-forward flaskskearlndemo 8000:80
```