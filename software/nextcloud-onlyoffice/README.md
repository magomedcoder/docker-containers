## Установка Nextcloud и Onlyoffice

#### Установка Nextcloud и Onlyoffice внутри Docker

```bash
git clone https://github.com/magomedcoder/docker-containers.git

cd ./software/nextcloud-onlyoffice

chmod 777 *

docker-compose up -d
```

#### Сохранение конфигурации

```bash
bash install-config.sh
```