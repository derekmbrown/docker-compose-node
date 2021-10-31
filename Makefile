build_docker:
	docker-compose up -d --build

delete_docker:
	docker stop $$(docker ps -aq)
	docker rm $$(docker ps -aq)
	docker images -q |xargs docker rmi
	docker system prune -f

list_docker:
	docker images && docker ps -a

exec_docker:
	docker exec -it node sh

logs_docker:
	docker logs node -f

reset_docker:
	make delete_docker
	make build_docker

test_docker:
	docker exec -it node node app.js
