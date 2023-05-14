FROM golang:1.16-buster AS builder

WORKDIR /app
COPY go.* ./
RUN go mod download
COPY *.go ./
RUN go build -o /main
ENTRYPOINT ["/main"]