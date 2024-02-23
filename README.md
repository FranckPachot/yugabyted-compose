# yugabyted-compose
Docker compose to start YugabyteDB with yugabyted

Example to start a RF=3 lab:
```
docker compose up -d --scale yb=3
docker compose logs psql
```
