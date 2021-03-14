FROM nginx:latest

COPY gen.sh /docker-entrypoint.d/

COPY . /usr/share/nginx/html
