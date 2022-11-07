#!/bin/bash

docker build -t dist-fed-core-identity . -f Dockerfile
docker tag dist-fed-core-identity hmaid/hyperledger:dist-fed-core-identity
docker push hmaid/hyperledger:dist-fed-core-identity

docker build -t dist-fed-core-identity-client . -f client/Dockerfile
docker tag dist-fed-core-identity-client hmaid/hyperledger:dist-fed-core-identity-client
docker push hmaid/hyperledger:dist-fed-core-identity-client

docker build -t dist-fed-core-identity-issuer . -f issuer/Dockerfile
docker tag dist-fed-core-identity-issuer hmaid/hyperledger:dist-fed-core-identity-issuer
docker push hmaid/hyperledger:dist-fed-core-identity-issuer

docker build -t dist-fed-core-identity-verifier . -f verifier/Dockerfile
docker tag dist-fed-core-identity-verifier hmaid/hyperledger:dist-fed-core-identity-verifier
docker push hmaid/hyperledger:dist-fed-core-identity-verifier

./von-network/manage build