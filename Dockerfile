FROM golang:1.17.8-alpine3.15 AS builder
WORKDIR /app
COPY . .
RUN go build

FROM alpine:3.15
WORKDIR /app
COPY --from=builder /app/batnoter .
COPY migrations ./migrations

CMD [ "/app/batnoter", "serve"]