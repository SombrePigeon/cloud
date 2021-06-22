
update: docker-compose.yml
	$(MAKE) down
	docker-compose up -d
	touch update

down:
	docker-compose down -v
	rm -f update