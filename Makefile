# ARGS = $(filter-out $@,$(MAKECMDGOALS))
# MAKEFLAGS += --silent

#############################
# IMAGES
#############################
build.%:
	@echo $@ | cut -d. -f 2 | xargs docker-compose build

up.%:
	@echo $@ | cut -d. -f 2 | xargs docker-compose up -d

logs.%:
	@echo $@ | cut -d. -f 2 | xargs docker-compose logs -f --tail=50

ip.%:
	@docker ps | grep "`echo $@ | cut -d. -f 2`" | awk '{ print $$1 }' | xargs docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 

ssh.%:
	@docker exec -it $$(echo $@ | cut -d. -f 2 | xargs docker-compose ps -q) sh

ps:
	@docker-compose ps

loadbalancer: build.loadbalancer up.loadbalancer logs.loadbalancer

mysql: build.mysql up.mysql logs.mysql

bot: build.bot up.bot logs.bot
