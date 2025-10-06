## Gitea + Woodpecker + Portainer

```bash
cd ./software/gitea-woodpecker-portainer

chmod +x run.sh

./run.sh gitea

# Gitea:
#    - http://127.0.0.1:3000
#    - OAuth2:
#      * Application Name: Woodpecker
#      * Redirect URI: http://127.0.0.1:3001/authorize

# Редактирование run.sh:
#    - Заполнить WOODPECKER_GITEA_CLIENT и WOODPECKER_GITEA_SECRET
#    - Сгенерировать WOODPECKER_AGENT_SECRET: openssl rand -hex 32

./run.sh
```