FROM golang:1.17 as builder

WORKDIR /app

COPY . /app

RUN CGO_ENABLED=0 go build -v -o telegram-notify .

FROM alpine:latest

COPY --from=builder /app/telegram-notify /telegram-notify

ENTRYPOINT ["/telegram-notify"]
