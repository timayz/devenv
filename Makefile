up:
	docker compose up -d

stop:
	docker compose stop

down:
	docker compose down -v

# https://github.com/FiloSottile/mkcert
cert.init:
	mkdir -p certs
	mkcert -key-file certs/timada.key -cert-file certs/timada.crt timada.localhost *.timada.localhost oathkeeper.localhost *.oathkeeper.localhost keto.localhost *.keto.localhost mailslurper.localhost *.mailslurper.localhost pikav.localhost traefik.localhost *.kratos.localhost
