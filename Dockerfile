FROM golang:1.16-buster AS builder

WORKDIR /go/src/app
COPY . .
RUN CGO_ENABLED=0 go build -o /app main.go
FROM scratch
COPY --from=builder /app /app
ENTRYPOINT  ["/app"]