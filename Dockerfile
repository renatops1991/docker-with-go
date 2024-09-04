FROM golang:1.18 as builder

WORKDIR /app

COPY . .

RUN go build -o server

FROM scratch

WORKDIR /app

COPY --from=builder /app/server .

EXPOSE 8080

ENTRYPOINT ["/app/server"]
