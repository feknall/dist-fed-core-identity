#!/bin/bash

./von-network/manage stop
docker ps -a

docker compose down