#!/bin/bash
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user

# Make docker auto-start
sudo chkconfig docker on
# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version

# Inject configuration variables
SECRET_KEY_BASE=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 70)
sed -i "s/%ADMIN_USER_EMAIL/$ADMIN_USER_EMAIL" plausible-conf.env
sed -i "s/%ADMIN_USER_NAME/$ADMIN_USER_NAME" plausible-conf.env
sed -i "s/%ADMIN_USER_PWD/$ADMIN_USER_PWD" plausible-conf.env
sed -i "s/%HOST/$HOST" plausible-conf.env
sed -i "s/%SECRET_KEY_BASE/$SECRET_KEY_BASE" plausible-conf.env

sed -i "s/%ADMIN_USER_EMAIL/$ADMIN_USER_EMAIL" reverse-proxy/docker-compose.caddy-gen.yml
sed -i "s/%HOST/$HOST" reverse-proxy/docker-compose.caddy-gen.yml

./start.sh