dependency:
	sudo apt install -y docker.io
	sudo apt-get install -y tidy
	
	wget https://github.com/hadolint/hadolint/releases/download/v1.17.5/hadolint-Linux-x86_64
	mv hadolint-Linux-x86_64 /usr/local/bin/hadolint
	chmod +x /usr/local/bin/hadolint
	

lint:
	hadolint Dockerfile
	tidy -q -e src/*.html

build:
	docker build -t app .
	docker tag app harryhare/testapp:latest
	docker push harryhare/testapp:latest


all: lint
