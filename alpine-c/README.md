# Alpine + С

```bash
docker build -t alpine-c .
```

### Компиляция через gcc

```bash
docker run --rm --name alpine-c -v ./example-project:/example-project -it alpine-c "gcc -o example-project main.c"
```

### Компиляция с поддержкой Unicode и предупреждениями
```bash
docker run --rm --name alpine-c -v ./example-project:/example-project -it alpine-c "gcc -Wall -Wextra -std=c11 -o example-project main.c"
```

### Запуск скомпилированной программы
```bash
docker run --rm --name alpine-c -v ./example-project:/example-project -it alpine-c "gcc -o example-project main.c && ./example-project"
```