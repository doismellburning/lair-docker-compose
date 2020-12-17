.PHONY: bootstrap
bootstrap:
	docker network create proxy
	docker volume create grafana-storage

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
	systemctl enable docker-compose@grafana
	systemctl enable docker-compose@smokeping
