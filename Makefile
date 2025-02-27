.PHONY: install start stop bash composer migrate seed

install:
	docker-compose up -d --build
	docker-compose exec php composer install
	# docker-compose exec php php vendor/bin/doctrine orm:schema-tool:create
	echo "✅ Instalación completa. El servicio ya está corriendo."

start:
	docker-compose up -d

stop:
	docker-compose down

bash:
	docker-compose exec php bash

composer:
	docker-compose exec php composer install

migrate:
	docker-compose exec php php vendor/bin/doctrine orm:schema-tool:create

seed:
	echo "Seeding data..."