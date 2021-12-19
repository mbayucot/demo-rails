build:
	docker-compose build

rebuild:
	docker-compose up --build

start:
	docker-compose up

restart:
	docker-compose restart web

stop:
	docker-compose stop

test:
	docker exec -it myapp_api bash -c "bundle exec rspec"

exec-bash:
	docker exec -it demo_api bash

pg:
	docker exec -it demo_postgres bash -c "psql demo_development sysdba"
