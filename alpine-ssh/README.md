# Alpine + SSH

```bash
docker build --build-arg PASSWORD=passowrd -t alpine-ssh -f Dockerfile .
```

```bash
docker run -d -p 2222:22 --name alpine-ssh -t alpine-ssh
```