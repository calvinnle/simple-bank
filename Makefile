postgres:
	docker run --name simple_bank_db -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it simple_bank_db createdb --username=root --owner=root simple_bank

dropdb:
	docker exec -it simple_bank_db dropdb --username=root --owner=root simple_bank

startdb:
	docker start simple_bank_db

stopdb:
	docker stop simple_bank_db
	
psql:
	docker exec -it simple_bank_db psql

.PHONY: postgres createdb dropdb startdb stopdb psql
