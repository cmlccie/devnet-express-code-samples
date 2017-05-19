# Set the DOCKER_USER_ID environment variable to your DockerHub user ID before
# using this Makefile.

image: Dockerfile
	docker build --pull -t ${DOCKER_USER_ID}/dna-explained-demobot:latest .

upload:
	docker login
	docker push ${DOCKER_USER_ID}/dna-explained-demobot:latest

init:
	docker pull ${DOCKER_USER_ID}/dna-explained-demobot:latest
	docker-compose create

update:
	docker ${DOCKER_USER_ID}/dna-explained-demobot:latest
	docker-compose create --force-recreate

up: docker-compose.yml
	docker-compose up -d

logs:
	docker-compose logs

status:
	docker-compose ps

down: docker-compose.yml
	docker-compose stop

remove: docker-compose.yml
	docker-compose rm -f
