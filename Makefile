# Start PostgreSQL container
postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

# Create a new database
createdb:
	docker exec -it postgres12 createdb --username=root --owner=root simple_bank

# Drop the database
dropdb:
	docker exec -it postgres12 dropdb simple_bank

# Run all migrations up
migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

# Rollback all migrations down
migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

# Generate code using sqlc
sqlc:
	sqlc generate

# Run tests with coverage
test:
	go test -v -cover ./...

# Declare phony targets to avoid conflicts with files of the same name
.PHONY: postgres createdb dropdb migrateup migratedown sqlc test
