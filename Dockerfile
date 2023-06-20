FROM golang:1.20-alpine3.18 as build 

WORKDIR /app
COPY go.mod .
COPY main.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /goapp

FROM scratch
COPY --from=build /goapp /goapp 
ENTRYPOINT ["/goapp"]
