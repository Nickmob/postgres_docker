# Работа с PostgreSQL в Docker

Запуск PostgreSQL в Docker в чистом виде и с тестовой базой данных

## Запуск чистого контейнера с именованным томом

```bash
docker volume create postgresql

docker run -d \
	--name postgres17 \
	-e POSTGRES_PASSWORD=mysecretpassword \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v postgresql:/var/lib/postgresql/data \
	postgres:17
```

## Запуск контейнера с тестовой базой

```bash
docker volume create postgresql

docker run -d \
	--name postgres17 \
	-e POSTGRES_PASSWORD=mysecretpassword \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v postgresql:/var/lib/postgresql/data \
	-v ./init:/docker-entrypoint-initdb.d/
	postgres:17
```

## Запуск с помощью docker compose

```bash
sudo docker compose up -d
```

## Подключение в терминале с помощью psql

```bash
sudo docker exec -ti postgres_docker-db-1 psql -U postgres
```

Зайти в терминал контейнера

```bash
sudo docker exec -ti postgres_docker-db-1 bash
```

## Просмотр логов

```
sudo docker logs postgres_docker-db-1
```

## Очистка системы

Удаление контейнера и тома из docker compose
```
sudo docker compose rm -fsv
sudo docker volume rm postgres_docker_postgresql
```
Удаление контейнера

```
sudo docker rm -f postgres_docker-db-1

```

Удаление тома

```
sudo docker volume rm postgresql

```