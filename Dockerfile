FROM golang:alpine as build-env
COPY . /src
WORKDIR /src
RUN go build -o gowon-congratulations

FROM alpine:3.16.0
WORKDIR /app
COPY --from=build-env /src/gowon-congratulations /app/
ENTRYPOINT ["./gowon-congratulations"]
