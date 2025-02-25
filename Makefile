.PHONY: up down bash composer migrate seed

up:
	docker-compose up -d --build

down:
	docker-compose down

bash:
	docker-compose exec php bash

composer:
	docker-compose exec php composer install

migrate:
	docker-compose exec php php vendor/bin/doctrine orm:schema-tool:create

seed:
	echo "Seeding data..."