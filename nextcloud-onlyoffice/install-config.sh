#!/bin/bash
set -x
docker exec -u www-data service-nextcloud php occ --no-warnings config:system:get trusted_domains >>trusted_domain.tmp
if ! grep -q "service-nginx" trusted_domain.tmp; then
  TRUSTED_INDEX=$(cat trusted_domain.tmp | wc -l)
  docker exec -u www-data service-nextcloud php occ --no-warnings config:system:set trusted_domains $TRUSTED_INDEX --value="service-nginx"
fi
rm trusted_domain.tmp
docker exec -u www-data service-nextcloud php occ --no-warnings app:install onlyoffice
docker exec -u www-data service-nextcloud php occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/onlyoffice-document-path/"
docker exec -u www-data service-nextcloud php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://service-onlyoffice/"
docker exec -u www-data service-nextcloud php occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://service-nginx/"
docker exec -u www-data service-nextcloud php occ --no-warnings config:system:set allow_local_remote_servers --value=true