.PHONY: help start stop down build restart migrate createsuperuser logs

help:
	@echo "Commands:"
	@echo "  make start              - Build and run the project (docker-compose up --build)"
	@echo "  make stop               - Stop containers (docker-compose stop)"
	@echo "  make down               - Stop and remove containers (docker-compose down)"
	@echo "  make restart            - Restart project (down -> up)"
	@echo "  make migrate            - Make and apply Django migrations"
	@echo "  make create_superuser    - Create Django superuser"
	@echo "  make logs               - Show all containers logs"

start:
	docker compose up -d --build

stop:
	docker compose down

down:
	docker compose down -v

restart:
	make down
	make start

migrate:
	docker compose exec -t backend python manage.py makemigrations
	docker compose exec -t backend python manage.py migrate

create_superuser:
	docker compose exec -t backend python manage.py createsuperuser

logs:
	docker-compose logs -f