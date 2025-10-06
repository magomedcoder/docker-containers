#!/usr/bin/env bash

export GITEA_DOMAIN=127.0.0.1
export GITEA_ROOT_URL="http://127.0.0.1:3000"

export DRONE_ADDRESS="127.0.0.1:3001"

export DRONE_GITEA_CLIENT_ID=""
export DRONE_GITEA_CLIENT_SECRET=""

# openssl rand -hex 16
export DRONE_RPC_SECRET=""
export DRONE_USER_CREATE="username:magomedcoder,machine:false,admin:true,token:${DRONE_RPC_SECRET}"

MODE=${1}

case $MODE in
    "gitea")
        docker-compose up -d mariadb
        docker-compose up -d gitea
        ;;
    *)
        docker-compose up -d
        ;;
esac