# spacy hasura server

how to get up and running

1. Start Hasura and Postgres
```bash
docker compose up -d
```

2. Apply migrations and metadata using the Hasura CLI

Install the CLI if you haven't already:
```bash
curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash
```

Apply metadata and migrations:
```bash
hasura metadata apply --endpoint http://localhost:8080 --admin-secret password
hasura migrate apply --database-name default --endpoint http://localhost:8080 --admin-secret password
hasura metadata reload --endpoint http://localhost:8080 --admin-secret password
```

The Hasura console will be available at http://localhost:8080 with admin secret `password`.

### Using the Hasura Console

To use the Hasura Console via CLI (recommended for making schema changes):

```bash
hasura console
```

This will open the console and automatically track any changes you make to the migrations and metadata files.
