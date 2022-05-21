ifeq ($(WEBSITES_ENV), prod)
 $(info env $(WEBSITES_ENV) detected)
 COMPOSE_FILE=docker-compose.yml
else ifeq ($(WEBSITES_ENV), dev)
 $(info env $(WEBSITES_ENV) detected)
 COMPOSE_FILE=docker-compose-dev.yml
else
 $(error : WEBSITES_ENV is not defined to "dev" or "prod";)
endif

update: update-check
	$(MAKE) .update

.update: $(COMPOSE_FILE) web/Dockerfile 
	$(MAKE) down
	docker-compose -f $(COMPOSE_FILE) up -d db --build
	sleep 10
	docker-compose -f $(COMPOSE_FILE) up -d --build
	@touch .update

down:
	docker-compose -f $(COMPOSE_FILE) down
	@rm -f .update

update-check:
	docker-compose ps -q | grep -q "" || rm -f .update

.PHONY: update update-check down