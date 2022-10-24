env = local

setup: build upd _wait logs

upbuild: build up

up:
	docker-compose -f docker-compose-${env}.yml up

upd:
	docker-compose -f docker-compose-${env}.yml up -d

build:
	docker-compose -f docker-compose-${env}.yml build

shell:
	docker-compose -f docker-compose-${env}.yml exec -w /app ta5feed python manage.py shell

bash:
	docker-compose -f docker-compose-${env}.yml exec -w /app ta5feed bash

makemigrations:
	docker-compose -f docker-compose-${env}.yml run --rm ta5feed python manage.py makemigrations

migrate:
	docker-compose -f docker-compose-${env}.yml run --rm ta5feed python manage.py migrate

makemessages:
	docker-compose -f docker-compose-${env}.yml run --rm ta5feed python manage.py makemessages --no-location -l ar

compilemessages:
	docker-compose -f docker-compose-${env}.yml run --rm ta5feed python manage.py compilemessages

logs:
	docker-compose -f docker-compose-${env}.yml logs -f

collectstatic:
	docker-compose -f docker-compose-${env}.yml exec -w /app ta5feed python manage.py collectstatic --noinput

debug:
	docker-compose -f docker-compose.local.yml run --service-ports --rm ta5feed

down:
	docker-compose -f docker-compose-${env}.yml down

destroy:
	docker-compose -f docker-compose-${env}.yml down -v

ps:
	docker-compose -f docker-compose-${env}.yml ps

rm_pyc:
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '__pycache__' -exec rm -rf {} +

_wait:
	@echo "Sleep 30 seconds until django runs"
	@sleep 30