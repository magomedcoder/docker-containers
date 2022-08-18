## Установка Docker

```bash
chmod 777 docker-installation.sh

./docker-installation.sh
```

---

## Установка Minikube

> ### Что вам понадобится
> * Ubuntu 20.04
> * Количество CPU 2
> * Количество RAM 2GB
> * 20GB свободного места на диске

```bash
chmod 777 minikube-installation.sh

./minikube-installation.sh
```

### Ошибка

```bash
# ls: cannot access '.minikube/cache/linux': No such file or directory
mkdir .minikube/cache/linux
```

```bash
# mv: cannot stat '.minikube/cache/linux//kubectl': No such file or directory
mkdir .minikube/cache/linux//kubectl
```

```bash
# chown: cannot access '/root/.kube': No such file or directory
mkdir /root/.kube
```

```bash
# mv: cannot stat '.minikube/cache/linux/kubectl/kubectl': No such file or directory
mkdir .minikube/cache/linux/kubectl/kubectl
```

```bash
# mv: cannot stat 'v1.21.2/kubectl': No such file or directory
mkdir  v1.21.2 v1.21.2/kubectl # версия может отличатся
```

```bash
# mv: cannot overwrite directory '/usr/local/bin/kubectl' with non-directory
rm /usr/local/bin/kubectl
```

```bash
#  due to HOST_JUJU_LOCK_PERMISSION: Failed to start host: boot lock: unable to open /tmp/juju-****: permission denied
rm  /tmp/juju-*
```

```bash
# Необходимо перезапустить
./minikube-installation.sh
```