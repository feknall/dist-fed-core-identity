#!/bin/bash

echo "Start bringing up von-network containers..."
./von-network/manage start
echo "Result:"
docker ps -a