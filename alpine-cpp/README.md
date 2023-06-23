# Alpine + С++

```bash
docker build -t alpine-cpp .
```

```bash
docker run --rm --name alpine-cpp -v ./project:/project -it --entrypoint bash alpine-cpp
```

### Makefile

```bash
docker run --rm --name alpine-cpp -v ./project:/project -it alpine-cpp "make"
```

### CMake

```bash
docker run --rm --name alpine-cpp -v ./project:/project -it alpine-cpp "mkdir -p build && cd build && cmake .. && make"
```

### Conan

```bash
docker run --rm --name alpine-cpp -v ./project:/project -it alpine-cpp "mkdir -p build && cd build && conan install .. && conan build .."
```


### G++

```bash
docker run --rm --name alpine-cpp -v ./project:/project -it alpine-cpp "g++ main.cpp main.o"
```