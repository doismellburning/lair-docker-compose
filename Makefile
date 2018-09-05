.PHONY: bootstrap
bootstrap:
	docker create network proxy

.PHONY: udev
udev:
	cp etc/99-zwave.rules /etc/udev/rules.d
	service udev restart

.PHONY: install
install:
	cp /srv/git/lair-docker-compose/etc/docker-compose@.service /etc/systemd/system/docker-compose@.service
	systemctl enable docker-compose@traefik
	systemctl enable docker-compose@hadashboard
	systemctl enable docker-compose@homeassistant
	systemctl enable docker-compose@prometheus
