# Alpine + Nginx + PHP8

```bash
docker build -t alpine-nginx-php .
```

```bash
docker run -p 8080:80 --name alpine-nginx-php -t alpine-nginx-php
```