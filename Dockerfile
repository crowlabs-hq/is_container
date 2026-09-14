## Used only for the docker-smoke CI job. Not meant to be used by the package end-users.
FROM ghcr.io/gleam-lang/gleam:v1.18.1-erlang-alpine

WORKDIR /app
COPY . .

CMD ["gleam", "run", "-m", "docker_smoke"]
