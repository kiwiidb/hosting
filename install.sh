#!/bin/bash
if docker ps ; then
	echo "Docker already running"
else
	echo "Docker not yet running, installing and starting now"
	amazon-linux-extras install docker -y
	service docker start
	# Make docker auto-start
	chkconfig docker on
fi
if /usr/local/bin/docker-compose version ; then
	echo "docker-compose already installed"
else
	# Install docker-compose
	curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	/usr/local/bin/docker-compose version
fi

export SECRET_KEY_BASE=$(openssl rand -base64 64 | tr -d '\n')
/usr/local/bin/docker-compose -f docker-compose.yml -f reverse-proxy/docker-compose.caddy-gen.yml up -d