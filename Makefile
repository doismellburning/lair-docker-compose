.PHONY: bootstrap
bootstrap:
	docker create network proxy

.PHONY: install
install:
	cp /srv/git/lair-docker-compose/etc/docker-compose@.service /etc/systemd/system/docker-compose@.service
	systemctl enable docker-compose@traefik
	systemctl enable docker-compose@hadashboard
	systemctl enable docker-compose@homeassistant
