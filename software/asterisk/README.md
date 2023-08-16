# Alpine + Asterisk

```bash
docker build -t alpine-asterisk .
```

```bash
docker run -it --rm -p 5060:5060/udp -p 18000-18100:18000-18100/udp --name alpine-asterisk -t alpine-asterisk
```