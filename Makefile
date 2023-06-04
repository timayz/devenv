init: cert.init root.up cockroach.up ory.up timada.up

# https://github.com/FiloSottile/mkcert
cert.init:
	mkdir -p traefik/certs
	mkcert -key-file traefik/certs/timada.key -cert-file traefik/certs/timada.crt timada.localhost *.timada.localhost

down: timada.down ory.down cockroach.down root.down

stop: timada.stop ory.stop cockroach.stop root.stop

root.up:
	docker compose up -d --remove-orphans

root.stop:
	docker compose stop

root.down:
	docker compose down -v --remove-orphans

cockroach.up:
	docker compose -p cockroach -f docker-compose.cockroach.yml up -d --remove-orphans

cockroach.stop:
	docker compose -p cockroach -f docker-compose.cockroach.yml stop

cockroach.down:
	docker compose -p cockroach -f docker-compose.cockroach.yml down -v --remove-orphans

ory.up:
	docker compose -p ory -f docker-compose.ory.yml up -d --remove-orphans

ory.stop:
	docker compose -p ory -f docker-compose.ory.yml stop

ory.down:
	docker compose -p ory -f docker-compose.ory.yml down -v --remove-orphans

timada.up:
	docker compose -p timada -f docker-compose.timada.yml up -d --remove-orphans

timada.stop:
	docker compose -p timada -f docker-compose.timada.yml stop

timada.down:
	docker compose -p timada -f docker-compose.timada.yml down -v --remove-orphans
