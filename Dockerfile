FROM grafana/grafana:latest

COPY . /usr/share/grafana

WORKDIR /usr/share/grafana

RUN yarn install --pure-lockfile \
    && yarn build \
    && go mod tidy \
    && go build -o bin/grafana-server ./pkg/cmd/grafana-server

EXPOSE 3000

CMD ["./bin/grafana-server", "--homepath", "/usr/share/grafana"]
