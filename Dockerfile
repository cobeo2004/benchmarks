FROM golang:1.23-alpine

RUN apk add --no-cache build-base


WORKDIR /pb

COPY . .

RUN go mod tidy

RUN CGO_ENABLED=1 go build -o /pb/pocketbase

EXPOSE 8090

ENV GOMEMLIMIT=500MiB

ADD docker_cmd.sh /docker_cmd.sh

CMD /docker_cmd.sh
