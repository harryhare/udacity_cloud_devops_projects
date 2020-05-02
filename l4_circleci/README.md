[![CircleCI](https://circleci.com/gh/harryhare/project-ml-microservice-kubernetes.svg?style=svg)](https://circleci.com/gh/harryhare/project-ml-microservice-kubernetes)

## Project Overview

This project provides a  Machine Learning Microservice API. 

This project contains a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on.
You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). 
This project contains a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. 
This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.


## Setup the Environment

* Create a virtualenv and activate it
* Run `make install` to install the necessary dependencies

### Running `app.py`

1. Standalone:  `python app.py`
2. Run in Docker:  `./run_docker.sh`
3. Upload to Docker Hub: `./upload_docker.sh` 
4. Run in Kubernetes:  `./run_kubernetes.sh`
5. Test the service: `make_prediction.sh`

### Kubernetes Steps

* Setup and Configure Docker locally 
  ```
  sudo apt install docker.io
  ```
* Setup and Configure Kubernetes locally
  ```bash
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
	  && chmod +x minikube
	sudo install minikube /usr/local/bin/
	
	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	sudo install kubectl /usr/local/bin/
  
  ```
* Create Flask app in Container 
  ```
  ./run_docker.sh
  
  ```
* Run via kubectl
  ```
  ./run_kubernetes.sh
  ```

### Files

* Circleci configuration `.circleci/config.yml`
* Pretrained data `model_data/`
* Output files `output_txt_files/`
* Makefile `Makefile`
* Dockerfile `Dockerfile`
* Test command `make_prediction.sh`
* Run app as docker `run_docker.sh`
* Tag & Push to DockerHub `upload_docker.sh`
* Run app as kubernetes `run_kubernetes.sh`
* The app Entrance file `app.py`

