#!/usr/bin/env bash

export PROTO=http://
export IP_ADDRESS=127.0.0.1

export GITEA_PROTO_IP_ADDRESS="${PROTO}${IP_ADDRESS}:3000"
export DRONE_IP_ADDRESS="${IP_ADDRESS}:3001"

export DRONE_GITEA_CLIENT_ID=""
export DRONE_GITEA_CLIENT_SECRET=""

export DRONE_RPC_SECRET="" # openssl rand -hex 16
export DRONE_USER_CREATE="username:magomedcoder,machine:false,admin:true,token:${DRONE_RPC_SECRET}"

docker-compose up -d

echo "Gitea ${GITEA_PROTO_IP_ADDRESS}"
echo "Drone ${PROTO}${DRONE_IP_ADDRESS}"