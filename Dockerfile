# syntax=docker/dockerfile:1

# версия среды для go

# Build

FROM golang:1.20.2 AS build

WORKDIR /app

COPY go.mod .
#COPY go.sum .

RUN go mod download

COPY *.go .

RUN go build -o /server

# Deploy

FROM debian:latest

WORKDIR /

COPY --from=build /server /usr/local/bin/server

EXPOSE 8080

ENTRYPOINT [ "/usr/local/bin/server"]