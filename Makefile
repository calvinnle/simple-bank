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

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up
	
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

psql:
	docker exec -it simple_bank_db psql

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb startdb stopdb psql migratedown migrateup sqlc test
