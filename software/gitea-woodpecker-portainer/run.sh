#!/usr/bin/env bash

export GITEA_DOMAIN=127.0.0.1
export GITEA_ROOT_URL="http://127.0.0.1:3000"

export WOODPECKER_HOST_ADDRESS="http://127.0.0.1:3001"

# openssl rand -hex 32
export WOODPECKER_AGENT_SECRET=""
export WOODPECKER_GITEA_CLIENT=""
export WOODPECKER_GITEA_SECRET=""

MODE=${1}

case $MODE in
    "gitea")
        docker compose up -d postgres
        docker compose up -d gitea
        ;;
    *)
        docker compose up -d
        ;;
esac