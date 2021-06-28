
update: docker-compose.yml
	$(MAKE) down
	docker-compose pull
	docker-compose up -d --build
	touch update

down:
	docker-compose stop
	rm -f update