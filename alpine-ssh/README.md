# Alpine + SSH

## Минимальный образ докера на основе Alpine Linux

## Как запустить контейнер docker с помощью ssh?

##### Вы можете использовать приведенную ниже команды для запуска контейнера docker.

<pre>
docker build --build-arg PASSWORD=passowrd -t magomedcoder/alpine-ssh -f Dockerfile .
</pre>

<pre>
docker run -d -p 2222:22 magomedcoder/alpine-ssh
</pre>

### Для подключения контейнера docker через ssh.

<pre>
ssh root@localhost -p 2222
</pre>