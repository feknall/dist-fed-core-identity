#!/bin/bash

echo "Start bringing up aries agent..."
docker compose run client
echo "Result:"
docker ps -a