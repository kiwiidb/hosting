#!/bin/bash

docker-compose -f docker-compose.yml -f reverse-proxy/docker-compose.caddy-gen.yml up -d