# Alpine + Rust

```bash
docker build -t alpine-rust .
```

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it --entrypoint sh alpine-rust
```

### Сборка проекта

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo build"
```

### Запуск приложения

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo run"
```

### Тестирование

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo test"
```

### Проверка кода

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo check"
```

### Сборка в режиме release

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo build --release"
```

### Тесты с выводом

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo test -- --nocapture"
```

### Генерация документации

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo doc --no-deps"
```

### Статический анализ кода

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo clippy"
```

### Форматирование кода

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo fmt"
```

### Бенчмарки

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo bench"
```

### Очистка проекта

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo clean"
```

### Разработка с горячей перезагрузкой

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "cargo watch -x run"
```

### Запуск собранного приложения

```bash
docker run --rm --name alpine-rust -v ./example-project:/example-project -it alpine-rust "./example-project"
```
