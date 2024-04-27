## Setup
Copy `.env.example` to `.env.`

## Getting Started

First, run the ReScript compiler:

```bash
yarn res:watch
```

Second, run the Next server

```
yarn dev
```


## Running API Server

Prerequisites
1. [Docker](https://docs.docker.com/engine/install/)
   1. Highly recommend [OrbStack](https://orbstack.dev/) for Mac instead of Docker Desktop
2. Optional: [Hasura CLI](https://hasura.io/docs/latest/hasura-cli/install-hasura-cli/) (Optional)
   1. Helps with migrations and config files in case you want to modify the API :) not necessary

### Running Hasura
Go to `./spacy-server` and run

```bash
docker compose up -d
```

And that's it! You now have a Postgres + GraphQL API
