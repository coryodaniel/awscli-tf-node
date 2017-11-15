stop:
	docker stop awscli-tf-node
rm:
	docker rm awscli-tf-node
clean: stop-docker rm-docker
build:
	docker build -t awscli-tf-node . &&\
	docker tag awscli-tf-node:latest coryodaniel/awscli-tf-node:latest
pull:
	docker pull coryodaniel/awscli-tf-node:latest
push:
	docker push coryodaniel/awscli-tf-node:latest
logs:
	docker logs awscli-tf-node
run:
	docker run -it coryodaniel/awscli-tf-node /bin/bash
connect:
	docker exec -it coryodaniel/awscli-tf-node /bin/bash
