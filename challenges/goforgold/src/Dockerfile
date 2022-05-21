FROM golang
WORKDIR /app

ADD main.go .
ADD go.mod .
RUN go build -o gold main.go