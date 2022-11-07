#!/bin/bash

echo "Start bringing up aries agent..."
docker compose run issuer
echo "Result:"
docker ps -a