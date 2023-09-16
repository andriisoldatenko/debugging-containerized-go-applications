# Compile stage
FROM golang:1.21.1-alpine3.18 AS build-env
ENV CGO_ENABLED 0
WORKDIR /usr/src/app

# pre-copy/cache go.mod for pre-downloading dependencies and only redownloading them in subsequent builds if they change
COPY ./sample_app/go.mod ./sample_app/go.sum ./
RUN go mod download && go mod verify

COPY ./sample_app .
RUN go build -v -o /usr/local/bin/app ./...

# Final stage
FROM alpine:3.18
EXPOSE 8080
WORKDIR /
COPY --from=build-env /usr/local/bin/app /
CMD ["/app"]