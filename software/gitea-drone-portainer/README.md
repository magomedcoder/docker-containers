## Gitea + Drone

```bash
cd ./software/gitea-drone-portainer

chmod +x run.sh

./run.sh gitea

# Gitea:
#    - http://127.0.0.1:3000
#    - OAuth2:
#      * Application Name: Drone
#      * Redirect URI: http://127.0.0.1:3001/authorize

# Редактирование run.sh:
#    - Заполнить DRONE_GITEA_CLIENT_ID и DRONE_GITEA_CLIENT_SECRET
#    - Сгенерировать DRONE_RPC_SECRET: openssl rand -hex 32

./run.sh
```