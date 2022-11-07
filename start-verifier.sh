#!/bin/bash

echo "Start bringing up aries agent..."
docker compose run verifier
echo "Result:"
docker ps -a