.PHONY: install
install:
	docker create network proxy
	ln -s /srv/git/lair-docker-compose/etc/docker-compose@.service /etc/systemd/system/docker-compose@.service
