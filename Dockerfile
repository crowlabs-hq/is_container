## WARNING: Not meant to be used by the package end-users.
## This is used only for the CI workflows (smoke tests).

FROM ghcr.io/gleam-lang/gleam:v1.18.1-erlang-alpine

WORKDIR /app
COPY . .

# Default
ARG SMOKE_MODULE=docker_smoke

ENV SMOKE_MODULE=${SMOKE_MODULE}

CMD ["sh", "-c", "gleam run -m $SMOKE_MODULE"]
